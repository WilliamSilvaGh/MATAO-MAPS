using MataoMaps.Data.Context;
using MataoMaps.CrossCutting;
using System.Text.Json.Serialization;
using MataoMaps.Domain.DTOs.Ocorrencia.Response;
using MataoMaps.Domain.DTOs.Ocorrencia.Request;
using MataoMaps.Domain.Entities;
using MataoMaps.Domain.DTOs.Usuario.Request;
using MataoMaps.Domain.DTOs.Usuario.Response;
using MataoMaps.Domain.Extensions;
using System.Security.Claims;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using System.IdentityModel.Tokens.Jwt;
using PdfSharpCore.Drawing;
using PdfSharpCore.Pdf;
using Microsoft.EntityFrameworkCore;
using MataoMaps.Domain.Enumerators;

var builder = WebApplication.CreateBuilder(args);
Guid usuarioLogadoId;
bool usuarioLogadoEhAdmin;

builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll", policy =>
    {
        policy.AllowAnyOrigin()  // Permite qualquer origem
              .AllowAnyMethod()  // Permite qualquer método (GET, POST, etc)
              .AllowAnyHeader(); // Permite qualquer cabeçalho
    });
});

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(options =>
{
    options.EnableAnnotations();
});

builder.Services.AddDbContext<MataoMapsContext>();
//builder.Services.AddControllers().AddJsonOptions(options => options.JsonSerializerOptions.Converters.Add(new JsonStringEnumConverter()));

builder.Services.ConfigureHttpJsonOptions(options =>
{
    options.SerializerOptions.Converters.Add(new JsonStringEnumConverter());
});

builder.Services.ConfigureAuthentication();
builder.Services.ConfigureAuthenticateSwagger();

var app = builder.Build();

app.UseCors("AllowAll");

app.UseSwagger();
app.UseSwaggerUI();

app.UseAuthentication();
app.UseAuthorization();
app.UseHttpsRedirection();

#region Endpoints de Ocorrencia
app.MapGet("/ocorrencia/listar", (MataoMapsContext context, ClaimsPrincipal user) =>
{
    try
    {
        SetarDadosToken(user);

        if (usuarioLogadoEhAdmin)
        {
            var ocorrenciasAdmin = context.OcorrenciaSet.Select(ocorrencia => new OcorrenciaListarResponse
            {
                Id = ocorrencia.Id,
                UsuarioNome = ocorrencia.Usuario.Nome,
                Data = ocorrencia.Data,
                Latitude = ocorrencia.Latitude,
                Longitude = ocorrencia.Longitude,
                FotoBase64 = ocorrencia.FotoBase64,
                Endereco = ocorrencia.Endereco,
                Descricao = ocorrencia.Descricao,
                DataResolucao = ocorrencia.DataResolucao,
                FotoResolucao = ocorrencia.FotoResolucao,
                Resolucao = ocorrencia.Resolucao,
                Status = ocorrencia.Status
            });

            return Results.Ok(ocorrenciasAdmin);
        }

        var ocorrencias = context.OcorrenciaSet.Where(p => p.UsuarioId == usuarioLogadoId).Select(ocorrencia => new OcorrenciaListarResponse
        {
            Id = ocorrencia.Id,
            UsuarioNome = ocorrencia.Usuario.Nome,
            Data = ocorrencia.Data,
            Latitude = ocorrencia.Latitude,
            Longitude = ocorrencia.Longitude,
            FotoBase64 = ocorrencia.FotoBase64,
            Endereco = ocorrencia.Endereco,
            Descricao = ocorrencia.Descricao,
            DataResolucao = ocorrencia.DataResolucao,
            FotoResolucao = ocorrencia.FotoResolucao,
            Resolucao = ocorrencia.Resolucao,
            Status = ocorrencia.Status
        }
        );

        return Results.Ok(ocorrencias);

    }
    catch
    {
        return Results.BadRequest("Ocorreu um problema! Verifique se está logado!");
    }

})
.WithOpenApi(operation =>
{
    operation.Description = "Endpoint para obter todas as ocorrencias cadastradas";
    operation.Summary = "Listar todas as Ocorrencias";
    return operation;
})
    .WithTags("Ocorrencias")
    .RequireAuthorization();

app.MapGet("/ocorrencia/{ocorrenciaId}", (MataoMapsContext context, Guid ocorrenciaId) =>
{
    var ocorrencia = context.OcorrenciaSet.Find(ocorrenciaId);
    if (ocorrencia is null)
        return Results.BadRequest("Ocorrencia não Localizada.");

    var ocorrenciaDto = new OcorrenciaObterResponse
    {
        Id = ocorrencia.Id,
        UsuarioId = ocorrencia.UsuarioId,
        Data = ocorrencia.Data,
        Latitude = ocorrencia.Latitude,
        Longitude = ocorrencia.Longitude,
        FotoBase64 = ocorrencia.FotoBase64,
        Endereco = ocorrencia.Endereco,
        Descricao = ocorrencia.Descricao,
        DataResolucao = ocorrencia.DataResolucao,
        FotoResolucao = ocorrencia.FotoResolucao,
        Resolucao = ocorrencia.Resolucao,
        Status = ocorrencia.Status
    };

    return Results.Ok(ocorrenciaDto);
})
    .WithOpenApi(operation =>
    {
        operation.Description = "Endpoint para obter uma Ocorrencia com base no ID informado";
        operation.Summary = "Obter uma Ocorrencia";
        operation.Parameters[0].Description = "Id da Ocorrencia";
        return operation;
    })
    .WithTags("Ocorrencias")
    .RequireAuthorization();

app.MapPost("/ocorrencia/adicionar", (MataoMapsContext context, ClaimsPrincipal user, OcorrenciaAdicionarRequest ocorrenciaAdicionarRequest) =>
{
    if (user?.Identity?.IsAuthenticated != true)
        return Results.BadRequest("Logue antes de adicionar uma ocorrência");

    try
    {
        SetarDadosToken(user);

        var ocorrencia = new Ocorrencia(
            ocorrenciaAdicionarRequest.Data,
            ocorrenciaAdicionarRequest.Latitude,
            ocorrenciaAdicionarRequest.Longitude,
            ocorrenciaAdicionarRequest.FotoBase64,
            ocorrenciaAdicionarRequest.Endereco,
            ocorrenciaAdicionarRequest.Descricao,
            usuarioLogadoId
            );

        context.OcorrenciaSet.Add(ocorrencia);
        context.SaveChanges();

        return Results.Created("Created", $"Ocorrencia Registrada com Sucesso. {ocorrencia.Id}");
    }
    catch (Exception ex)
    {
        return Results.BadRequest(ex.InnerException?.Message ?? ex.Message);
    }
})
    .WithOpenApi(operation =>
    {
        operation.Description = "Endpoint para Cadastrar uma Ocorrencia";
        operation.Summary = "Nova Ocorrencia";
        return operation;
    })
    .WithTags("Ocorrencias")
    .RequireAuthorization();

app.MapPut("/ocorrencia/iniciar-atendimento", (MataoMapsContext context, ClaimsPrincipal user, OcorrenciaIniciarAtendimentoRequest ocorrenciaIniciarAtendimentoRequest) =>
{
    try
    {
        SetarDadosToken(user);

        if (usuarioLogadoEhAdmin)
        {
            var ocorrencia = context.OcorrenciaSet.Find(ocorrenciaIniciarAtendimentoRequest.Id);
            if (ocorrencia is null)
                return Results.BadRequest("Ocorrencia não Localizada.");

            ocorrencia.IniciarAtendimento();
            context.OcorrenciaSet.Update(ocorrencia);
            context.SaveChanges();

            return Results.Ok("Ocorrencia Iniciada com Sucesso.");
        }

        return Results.BadRequest("Usuário não permitido!");

    }
    catch (Exception ex)
    {
        return Results.BadRequest(ex.InnerException?.Message ?? ex.Message);
    }
})
    .WithOpenApi(operation =>
    {
        operation.Description = "Endpoint para Iniciar Atendimento a uma Ocorrencia";
        operation.Summary = "Iniciar uma Ocorrencia";
        return operation;
    })
    .WithTags("Ocorrencias")
    .RequireAuthorization();

app.MapPut("/ocorrencia/encerrar", (MataoMapsContext context, ClaimsPrincipal user, OcorrenciaEncerrarRequest ocorrenciaEncerrarRequest) =>
{
    try
    {
        SetarDadosToken(user);
        if (usuarioLogadoEhAdmin)
        {
            var ocorrencia = context.OcorrenciaSet.Find(ocorrenciaEncerrarRequest.Id);
            if (ocorrencia is null)
                return Results.BadRequest("Ocorrencia não Localizada.");

            ocorrencia.Encerrar(usuarioLogadoId, ocorrenciaEncerrarRequest.DataResolucao, ocorrenciaEncerrarRequest.FotoResolucao, ocorrenciaEncerrarRequest.Resolucao);
            context.OcorrenciaSet.Update(ocorrencia);
            context.SaveChanges();

            return Results.Ok("Ocorrencia Encerrada com Sucesso.");
        }
        return Results.BadRequest("Usuário não permitido");
    }
    catch (Exception ex)
    {
        return Results.BadRequest(ex.InnerException?.Message ?? ex.Message);
    }
})
    .WithOpenApi(operation =>
    {
        operation.Description = "Endpoint para Encerrar uma Ocorrencia";
        operation.Summary = "Encerrar Ocorrencia";
        return operation;
    })
    .WithTags("Ocorrencias")
    .RequireAuthorization();

// Endpoint para excluir todas as ocorrências
app.MapDelete("/ocorrencia/excluir-todas", (MataoMapsContext context, ClaimsPrincipal user) =>
{
    try
    {
        SetarDadosToken(user);

        // Verifica se o usuário é administrador
        if (usuarioLogadoEhAdmin)
        {
            var ocorrencias = context.OcorrenciaSet.ToList();  // Obtém todas as ocorrências

            if (ocorrencias.Any())
            {
                context.OcorrenciaSet.RemoveRange(ocorrencias); // Remove todas as ocorrências
                context.SaveChanges();

                return Results.Ok("Todas as ocorrências foram excluídas com sucesso.");
            }

            return Results.NotFound("Nenhuma ocorrência encontrada para excluir.");
        }
        else
        {
            return Results.BadRequest("Somente administradores podem excluir todas as ocorrências.");
        }
    }
    catch (Exception ex)
    {
        return Results.BadRequest($"Erro ao excluir as ocorrências: {ex.Message}");
    }
})
    .WithOpenApi(operation =>
    {
        operation.Description = "Endpoint para excluir todas as ocorrências do sistema (somente admin).";
        operation.Summary = "Excluir todas as ocorrências";
        return operation;
    })
    .WithTags("Ocorrencias")
    .RequireAuthorization();

// Endpoint para excluir uma ocorrência por ID
app.MapDelete("/ocorrencia/excluir/{ocorrenciaId}", (MataoMapsContext context, ClaimsPrincipal user, Guid ocorrenciaId) =>
{
    try
    {
        SetarDadosToken(user);

        var ocorrencia = context.OcorrenciaSet.Find(ocorrenciaId);
        if (ocorrencia is null)
            return Results.NotFound("Ocorrência não encontrada.");

        // Verifica se o usuário é o proprietário da ocorrência ou um administrador
        if (usuarioLogadoId == ocorrencia.UsuarioId || usuarioLogadoEhAdmin)
        {
            context.OcorrenciaSet.Remove(ocorrencia);
            context.SaveChanges();

            return Results.Ok("Ocorrência excluída com sucesso.");
        }
        else
        {
            return Results.BadRequest("Você não tem permissão para excluir esta ocorrência.");
        }
    }
    catch (Exception ex)
    {
        return Results.BadRequest($"Erro ao excluir a ocorrência: {ex.Message}");
    }
})
    .WithOpenApi(operation =>
    {
        operation.Description = "Endpoint para excluir uma ocorrência específica com base no ID.";
        operation.Summary = "Excluir uma ocorrência";
        operation.Parameters[0].Description = "ID da Ocorrência";
        return operation;
    })
    .WithTags("Ocorrencias")
    .RequireAuthorization();


app.MapGet("/ocorrencia/gerar-relatorio-pdf", async (MataoMapsContext context, ClaimsPrincipal user, DateOnly startDate, DateOnly endDate) =>
{
    try
    {
        SetarDadosToken(user);

        if (!usuarioLogadoEhAdmin)
        {
            return Results.BadRequest("Apenas administradores podem gerar o relatório.");
        }

        var ocorrencias = await context.OcorrenciaSet
            .Where(o => o.Data >= startDate && o.Data <= endDate)
            .Select(o => new OcorrenciaListarResponse
            {
                Id = o.Id,
                UsuarioNome = o.Usuario.Nome,
                Data = o.Data,
                Latitude = o.Latitude,
                Longitude = o.Longitude,
                FotoBase64 = o.FotoBase64,
                Endereco = o.Endereco,
                Descricao = o.Descricao,
                Resolucao = o.Resolucao,
                Status = o.Status
            })
            .ToListAsync();

        if (!ocorrencias.Any())
        {
            return Results.BadRequest("Nenhuma ocorrência encontrada no intervalo de datas especificado.");
        }

        var pdfDocument = new PdfDocument();
        var page = pdfDocument.AddPage();
        var gfx = XGraphics.FromPdfPage(page);
        var font = new XFont("Arial", 10);
        var boldFont = new XFont("Arial", 12, XFontStyle.Bold);

        double yPosition = 20;

        // Título do Relatório
        string tituloRelatorio = "Relatório de Ocorrências";
        double tituloWidth = gfx.MeasureString(tituloRelatorio, boldFont).Width;
        double tituloXPosition = (page.Width - tituloWidth) / 2;
        gfx.DrawString(tituloRelatorio, boldFont, XBrushes.Black, new XPoint(tituloXPosition, yPosition));

        yPosition += 20;

        // Período
        string periodoRelatorio = $"Período: {startDate:dd/MM/yyyy} a {endDate:dd/MM/yyyy}";
        double periodoWidth = gfx.MeasureString(periodoRelatorio, font).Width;
        double periodoXPosition = (page.Width - periodoWidth) / 2;
        gfx.DrawString(periodoRelatorio, font, XBrushes.Black, new XPoint(periodoXPosition, yPosition));

        yPosition += 40;


        // Dividir Ocorrências Resolvidas e Não Resolvidas
        var ocorrenciasResolvidas = ocorrencias.Where(o => o.Status == EnumStatus.Concluido).ToList();
        var ocorrenciasNaoResolvidas = ocorrencias.Where(o => o.Status != EnumStatus.Concluido).ToList();

        // Seção de Ocorrências Resolvidas
        gfx.DrawString("Ocorrências Resolvidas", boldFont, XBrushes.Black, new XPoint(20, yPosition));
        yPosition += 20;

        // Adiciona uma Tabela para as Ocorrências Resolvidas
        AddOcorrenciasTable(pdfDocument, gfx, ocorrenciasResolvidas, ref yPosition, font);

        // Seção de Ocorrências Não Resolvidas
        yPosition += 20;
        gfx.DrawString("Ocorrências Não Resolvidas", boldFont, XBrushes.Black, new XPoint(20, yPosition));
        yPosition += 20;

        // Adiciona uma Tabela para as Ocorrências Não Resolvidas
        AddOcorrenciasTable(pdfDocument, gfx, ocorrenciasNaoResolvidas, ref yPosition, font);

        // Resumo final
        yPosition += 20;
        gfx.DrawString("Resumo do Relatório", boldFont, XBrushes.Black, new XPoint(20, yPosition));
        yPosition += 20;

        gfx.DrawString($"Total de Ocorrências Resolvidas: {ocorrenciasResolvidas.Count}", font, XBrushes.Black, new XPoint(20, yPosition));
        yPosition += 20;
        gfx.DrawString($"Total de Ocorrências Não Resolvidas: {ocorrenciasNaoResolvidas.Count}", font, XBrushes.Black, new XPoint(20, yPosition));

        // Salvar o PDF
        using (var stream = new MemoryStream())
        {
            pdfDocument.Save(stream, false);
            byte[] fileBytes = stream.ToArray();

            return Results.File(fileBytes, "application/pdf", "Relatorio_Ocorrencias.pdf");
        }
    }
    catch (Exception ex)
    {
        return Results.BadRequest($"Ocorreu um erro ao gerar o relatório: {ex.Message}");
    }
}).WithTags("Ocorrencias")
  .RequireAuthorization();

static void AddOcorrenciasTable(PdfDocument pdfDocument, XGraphics gfx, List<OcorrenciaListarResponse> ocorrencias, ref double yPosition, XFont font)
{
    const double pageWidth = 595; // Largura da página em pontos (A4 595px)
    const double pageHeight = 842; // Altura da página em pontos (A4 842px)

    const double margin = 20; // Margem esquerda e direita
    const double contentWidth = pageWidth - (2 * margin); // Largura do conteúdo (sem as margens)

    // Largura das colunas ajustada para 100% da largura disponível com margens
    const double col1Width = contentWidth * 0.30; // 30% da largura para a Descrição
    const double col2Width = contentWidth * 0.35; // 35% da largura para o Endereço
    const double col3Width = contentWidth * 0.20; // 20% da largura para o Status
    const double col4Width = contentWidth * 0.15; // 15% da largura para a Resolução

    const double padding = 7; // Aumentar o padding para um pouco mais de espaço vertical
    const double lineHeight = 12; // Altura da linha
    const double headerCellHeight = 25; // Altura da célula do título das colunas (aumentei para garantir mais espaço)

    // Fonte em negrito para os títulos (tamanho reduzido para 10)
    var boldFont = new XFont("Arial", 10, XFontStyle.Bold);

    // Desenha a tabela de ocorrências
    if (ocorrencias.Any())
    {
        // Adicionando o espaçamento para mover os títulos um pouco para baixo
        double titleSpacing = 5;  // Ajuste esse valor para mover os títulos para baixo mais ou menos
        yPosition += titleSpacing;  // Desloca os títulos para baixo

        // Desenha as células de título com a largura ajustada
        gfx.DrawRectangle(XPens.Black, margin, yPosition, col1Width, headerCellHeight);  // Descrição
        gfx.DrawRectangle(XPens.Black, margin + col1Width, yPosition, col2Width, headerCellHeight);  // Endereço
        gfx.DrawRectangle(XPens.Black, margin + col1Width + col2Width, yPosition, col3Width, headerCellHeight);  // Status
        gfx.DrawRectangle(XPens.Black, margin + col1Width + col2Width + col3Width, yPosition, col4Width, headerCellHeight);  // Resolução

        // Títulos centralizados (com fonte reduzida)
        gfx.DrawString("Descrição", boldFont, XBrushes.Black, new XPoint(margin + col1Width / 2, yPosition + (headerCellHeight / 2) - (lineHeight / 2)), XStringFormats.Center);
        gfx.DrawString("Endereço", boldFont, XBrushes.Black, new XPoint(margin + col1Width + col2Width / 2, yPosition + (headerCellHeight / 2) - (lineHeight / 2)), XStringFormats.Center);
        gfx.DrawString("Status", boldFont, XBrushes.Black, new XPoint(margin + col1Width + col2Width + col3Width / 2, yPosition + (headerCellHeight / 2) - (lineHeight / 2)), XStringFormats.Center);
        gfx.DrawString("Resolução", boldFont, XBrushes.Black, new XPoint(margin + col1Width + col2Width + col3Width + col4Width / 2, yPosition + (headerCellHeight / 2) - (lineHeight / 2)), XStringFormats.Center);

        // Ajuste de yPosition para começar logo após os títulos
        yPosition += headerCellHeight;  // Incrementa somente a altura do cabeçalho

        // Dados das ocorrências
        foreach (var ocorrencia in ocorrencias)
        {
            double rowHeight = 20; // Altura padrão da linha

            // Quebra de texto nas células
            var descricao = ocorrencia.Descricao;
            var endereco = ocorrencia.Endereco;
            var status = ocorrencia.Status.ToString();
            var resolucao = ocorrencia.Resolucao ?? "Não Resolvida";

            // Quebra de texto para ajustar dentro das células
            var descricaoLines = BreakTextToFit(descricao, col1Width - 2 * padding, font, gfx);
            var enderecoLines = BreakTextToFit(endereco, col2Width - 2 * padding, font, gfx);
            var statusLines = BreakTextToFit(status, col3Width - 2 * padding, font, gfx);
            var resolucaoLines = BreakTextToFit(resolucao, col4Width - 2 * padding, font, gfx);

            // Determina a altura da linha com base no maior número de linhas
            rowHeight = Math.Max(Math.Max(descricaoLines.Count, enderecoLines.Count),
                Math.Max(statusLines.Count, resolucaoLines.Count)) * lineHeight;

            // Desenha as células e o texto
            DrawCell(gfx, margin, yPosition, col1Width, rowHeight, descricaoLines, font, padding);
            DrawCell(gfx, margin + col1Width, yPosition, col2Width, rowHeight, enderecoLines, font, padding);
            DrawCell(gfx, margin + col1Width + col2Width, yPosition, col3Width, rowHeight, statusLines, font, padding);
            DrawCell(gfx, margin + col1Width + col2Width + col3Width, yPosition, col4Width, rowHeight, resolucaoLines, font, padding);

            yPosition += rowHeight;

            // Adiciona nova página, se necessário
            if (yPosition > pageHeight - 50)
            {
                var newPage = pdfDocument.AddPage();
                gfx = XGraphics.FromPdfPage(newPage);
                yPosition = 0; // Recomeça no topo da página
            }
        }
    }
}


// Método para desenhar uma célula com texto quebrado dentro dela
static void DrawCell(XGraphics gfx, double x, double y, double width, double height, List<string> lines, XFont font, double padding)
{
    gfx.DrawRectangle(XPens.Black, x, y, width, height);
    double textY = y + padding + 2; // Aumentando o espaço entre o topo da célula e o texto

    // Desenha cada linha do texto dentro da célula
    foreach (var line in lines)
    {
        gfx.DrawString(line, font, XBrushes.Black, new XPoint(x + padding, textY));
        textY += 12; // Ajuste para a próxima linha
    }
}

// Método para quebrar o texto nas linhas para caber nas células
static List<string> BreakTextToFit(string text, double maxWidth, XFont font, XGraphics gfx)
{
    var lines = new List<string>();
    var currentLine = "";
    var words = text.Split(' ');

    foreach (var word in words)
    {
        var testLine = string.IsNullOrEmpty(currentLine) ? word : currentLine + " " + word;
        if (gfx.MeasureString(testLine, font).Width <= maxWidth)
        {
            currentLine = testLine;
        }
        else
        {
            lines.Add(currentLine);
            currentLine = word;
        }
    }

    if (!string.IsNullOrEmpty(currentLine))
    {
        lines.Add(currentLine);
    }

    return lines;
}

#endregion

#region Endpoints de Usuários

app.MapGet("/usuario/listar", (MataoMapsContext context, ClaimsPrincipal user) =>
{
    SetarDadosToken(user);

    if (usuarioLogadoEhAdmin)
    {
        var usuariosAdmin = context.UsuarioSet.Select(usuario => new UsuarioListarResponse
        {
            Id = usuario.Id,
            Nome = usuario.Nome,
            EhAdmin = usuario.EhAdmin
        });

        return Results.Ok(usuariosAdmin);
    }

    var usuario = context.UsuarioSet.Where(p => p.Id == usuarioLogadoId).Select(usuario => new UsuarioListarResponse
    {
        Id = usuario.Id,
        Nome = usuario.Nome,
        EhAdmin = usuario.EhAdmin
    });

    return Results.Ok(usuario);
})
    .WithOpenApi(operation =>
    {
        operation.Description = "Endpoint para obter todos os usuários cadastrados";
        operation.Summary = "Listar todos os Usuários";
        return operation;
    })
    .WithTags("Usuários")
    .RequireAuthorization();

app.MapGet("/usuario/{usuarioId}", (MataoMapsContext context, Guid usuarioId) =>
{
    var usuario = context.UsuarioSet.Find(usuarioId);
    if (usuario is null)
        return Results.BadRequest("Usuário não Localizado.");

    var usuarioDto = new UsuarioObterResponse
    {
        Id = usuario.Id,
        Nome = usuario.Nome,
        EmailLogin = usuario.EmailLogin,
        EhAdmin = usuario.EhAdmin
    };

    return Results.Ok(usuarioDto);
})
    .WithOpenApi(operation =>
    {
        operation.Description = "Endpoint para obter um usuário com base no ID informado";
        operation.Summary = "Obter um Usuário";
        operation.Parameters[0].Description = "Id do Usuário";
        return operation;
    })
    .WithTags("Usuários")
    .RequireAuthorization();

app.MapPost("/usuario/adicionar", (MataoMapsContext context, UsuarioAdicionarRequest usuarioAdicionarRequest) =>
{
    try
    {
        if (usuarioAdicionarRequest.EmailLogin != usuarioAdicionarRequest.EmailLoginConfirmacao)
            return Results.BadRequest("Email de Login não Confere.");

        if (usuarioAdicionarRequest.Senha != usuarioAdicionarRequest.SenhaConfirmacao)
            return Results.BadRequest("Senha não Confere.");

        if (context.UsuarioSet.Any(p => p.EmailLogin == usuarioAdicionarRequest.EmailLogin))
            return Results.BadRequest("Email já utilizado para Login em outro Usuário.");

        var usuario = new Usuario(
            usuarioAdicionarRequest.Nome,
            usuarioAdicionarRequest.EmailLogin,
            usuarioAdicionarRequest.Senha.EncryptPassword(),
            usuarioAdicionarRequest.EhAdmin);

        context.UsuarioSet.Add(usuario);
        context.SaveChanges();

        return Results.Created("Created", $"Usuário Registrado com Sucesso. {usuario.Id}");
    }
    catch (Exception ex)
    {
        return Results.BadRequest(ex.InnerException?.Message ?? ex.Message);
    }
})
    .WithOpenApi(operation =>
    {
        operation.Description = "Endpoint para Cadastrar um Usuário";
        operation.Summary = "Novo Usuário";
        return operation;
    })
    .WithTags("Usuários");

app.MapPut("/usuario/alterar-senha", (MataoMapsContext context, UsuarioAtualizarRequest usuarioAtualizarRequest) =>
{
    try
    {
        var usuario = context.UsuarioSet.Find(usuarioAtualizarRequest.UsuarioId);
        if (usuario is null)
            return Results.BadRequest("Usuário não Localizado.");

        if (usuarioAtualizarRequest.SenhaAtual.EncryptPassword() == usuario.Senha)
        {
            usuario.AlterarSenha(usuarioAtualizarRequest.SenhaNova.EncryptPassword());
            context.UsuarioSet.Update(usuario);
            context.SaveChanges();

            return Results.Ok("Senha Alterada com Sucesso.");
        }

        return Results.BadRequest("Ocorreu um Problema ao Alterar a Senha do Usuário.");
    }
    catch (Exception ex)
    {
        return Results.BadRequest(ex.InnerException?.Message ?? ex.Message);
    }
})
    .WithOpenApi(operation =>
    {
        operation.Description = "Endpoint para Alterar a Senha do Usuário";
        operation.Summary = "Alterar Senha";
        return operation;
    })
    .WithTags("Usuários")
    .RequireAuthorization();

app.MapPut("/usuario/alterar-visibilidade/{usuarioId}", (MataoMapsContext context, ClaimsPrincipal user, Guid usuarioId) =>
{
    try
    {
        // Verificar se o usuário logado é administrador
        SetarDadosToken(user);
        if (!usuarioLogadoEhAdmin)
            return Results.BadRequest("Apenas administradores podem alterar a visibilidade de usuários.");

        // Encontrar o usuário no banco de dados
        var usuario = context.UsuarioSet.Find(usuarioId);
        if (usuario is null)
            return Results.BadRequest("Usuário não localizado.");

        // Alterar a visibilidade do usuário
        usuario.AlterarVisibilidadeAdmin();

        // Salvar as alterações no banco de dados
        context.UsuarioSet.Update(usuario);
        context.SaveChanges();

        return Results.Ok("Visibilidade do usuário alterada com sucesso.");
    }
    catch (Exception ex)
    {
        return Results.BadRequest(ex.InnerException?.Message ?? ex.Message);
    }
})
.WithOpenApi(operation =>
{
    operation.Description = "Endpoint para alterar a visibilidade de um usuário (administrador ou usuário comum)";
    operation.Summary = "Alterar visibilidade do usuário";
    operation.Parameters[0].Description = "Id do usuário";
    return operation;
})
    .WithTags("Usuários")
    .RequireAuthorization();


app.MapDelete("/usuario/{usuarioId}", (MataoMapsContext context, Guid usuarioId, ClaimsPrincipal user) =>
{
    SetarDadosToken(user);

    if (usuarioLogadoEhAdmin)
    {
        try
        {

            var usuario = context.UsuarioSet.Find(usuarioId);
            if (usuario is null)
                return Results.BadRequest("Usuário n�o Localizada.");

            context.UsuarioSet.Remove(usuario);
            context.SaveChanges();

            return Results.Ok("Usuário Removido com Sucesso.");
        }
        catch (Exception ex)
        {
            return Results.BadRequest(ex.InnerException?.Message ?? ex.Message);
        }
    }
    else
    {
        return Results.BadRequest("Usuário sem permissão de exclusão.");
    }
})
    .WithOpenApi(operation =>
    {
        operation.Description = "Endpoint para Excluir um Usuário";
        operation.Summary = "Excluir Usuário";
        operation.Parameters[0].Description = "Id do Usuário";
        return operation;
    })
    .WithTags("Usuários")
    .RequireAuthorization();

#endregion

#region Autenticação

app.MapPost("/autenticar", (MataoMapsContext context, UsuarioAutenticarRequest usuarioAutenticarRequest) =>
{
    var usuario = context.UsuarioSet.FirstOrDefault(p => p.EmailLogin == usuarioAutenticarRequest.EmailLogin && p.Senha == usuarioAutenticarRequest.Senha.EncryptPassword());
    if (usuario is null)
        return Results.BadRequest("Não foi Possível Efetuar o Login.");

    var claims = new[]
    {
            new Claim("UsuarioId", usuario.Id.ToString()),
            new Claim(ClaimTypes.Name, usuario.Nome),
            new Claim("EhAdmin", usuario.EhAdmin ? "S" : "N")
        };

    //Recebe uma instância da Classe SymmetricSecurityKey
    //armazenando a chave de criptografia usada na criação do Token
    var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("{469e8343-8fa6-42b9-9553-2f6e182c21fa}"));

    //Recebe um objeto do tipo SigninCredentials contendo a chave de
    //criptografia e o algoritimo de seguran�a empregados na gera��o
    //de assinaturas digitais para tokens
    var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

    var token = new JwtSecurityToken(
        issuer: "matao.maps",
        audience: "matao.maps",
        claims: claims,
        expires: DateTime.Now.AddDays(30),
        signingCredentials: creds
    );

    return Results.Ok(new UsuarioTokenResponse
    {
        UsuarioId = usuario.Id,
        UsuarioNome = usuario.Nome,
        AccessToken = new JwtSecurityTokenHandler().WriteToken(token),
        EhAdmin = usuario.EhAdmin
    });
})
    .WithOpenApi(operation =>
    {
        operation.Description = "Endpoint para Autenticar um Usuário na API";
        operation.Summary = "Autenticar Usuário";
        return operation;
    })
    .WithTags("Segurança");

app.MapGet("/verificar-token", (HttpContext httpContext) =>
{
    var token = httpContext.Request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();

    if (string.IsNullOrEmpty(token))
        return Results.BadRequest("Token não fornecido.");

    try
    {
        var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("{469e8343-8fa6-42b9-9553-2f6e182c21fa}"));
        var handler = new JwtSecurityTokenHandler();
        var principal = handler.ValidateToken(token, new TokenValidationParameters
        {
            IssuerSigningKey = key,
            ValidIssuer = "matao.maps",
            ValidAudience = "matao.maps",
            ValidateIssuer = true,
            ValidateAudience = true,
            ValidateLifetime = true,  // Verifica a expiração do token
            ClockSkew = TimeSpan.Zero // Ignora a tolerância de tempo de 5 minutos padrão para expiração
        }, out var validatedToken);

        // Se o token for válido, retorna uma resposta de sucesso
        return Results.Ok(new { Message = "Token válido." });
    }
    catch (Exception ex)
    {
        // Se o token for inválido ou expirado, retorna 401
        return Results.BadRequest("Token inválido ou expirado.");
    }
})
.WithOpenApi(operation =>
{
    operation.Description = "Endpoint para Verificar a Validade de um Token JWT";
    operation.Summary = "Verificar Token";
    return operation;
})
.WithTags("Segurança");

#endregion

app.MapControllers();

app.Run();

#region Métodos de Apoio

void SetarDadosToken(ClaimsPrincipal user)
{
    usuarioLogadoId = Guid.Parse(user.Identities.First().Claims.ToList()[0].Value);
    usuarioLogadoEhAdmin = user.Identities.First().Claims.ToList()[2].Value == "S";
}

#endregion