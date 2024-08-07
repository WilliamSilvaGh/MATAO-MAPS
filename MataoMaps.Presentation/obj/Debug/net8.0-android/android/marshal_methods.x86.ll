; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [327 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [648 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 247
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 281
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 38948123, ; 6: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 289
	i32 39485524, ; 7: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42244203, ; 8: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 298
	i32 42639949, ; 9: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 10: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 11: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 322
	i32 68219467, ; 12: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 13: Microsoft.Maui.Graphics.dll => 0x44bb714 => 204
	i32 82292897, ; 14: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 83839681, ; 15: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 306
	i32 101534019, ; 16: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 265
	i32 117431740, ; 17: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 18: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 265
	i32 122350210, ; 19: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 20: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 285
	i32 136584136, ; 21: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 321
	i32 140062828, ; 22: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 314
	i32 142721839, ; 23: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 24: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 25: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 26: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 221
	i32 176265551, ; 27: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 28: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 267
	i32 184328833, ; 29: System.ValueTuple.dll => 0xafca281 => 151
	i32 205061960, ; 30: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 31: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 219
	i32 220171995, ; 32: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 33: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 241
	i32 230752869, ; 34: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 35: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 36: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 37: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 254259026, ; 38: Microsoft.AspNetCore.Components.dll => 0xf27af52 => 175
	i32 261689757, ; 39: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 224
	i32 276479776, ; 40: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 41: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 243
	i32 280482487, ; 42: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 240
	i32 291076382, ; 43: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 44: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 45: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 319
	i32 318968648, ; 46: Xamarin.AndroidX.Activity.dll => 0x13031348 => 210
	i32 321597661, ; 47: System.Numerics => 0x132b30dd => 83
	i32 321963286, ; 48: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 297
	i32 342366114, ; 49: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 242
	i32 360082299, ; 50: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 51: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 52: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 53: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 54: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 55: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 56: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 57: _Microsoft.Android.Resource.Designer => 0x17969339 => 323
	i32 403441872, ; 58: WindowsBase => 0x180c08d0 => 165
	i32 409257351, ; 59: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 317
	i32 441335492, ; 60: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 225
	i32 442565967, ; 61: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 62: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 238
	i32 451504562, ; 63: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 64: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 65: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 66: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 67: System.dll => 0x1bff388e => 164
	i32 476646585, ; 68: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 240
	i32 486930444, ; 69: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 253
	i32 489220957, ; 70: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 295
	i32 498788369, ; 71: System.ObjectModel => 0x1dbae811 => 84
	i32 513247710, ; 72: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 197
	i32 526420162, ; 73: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 74: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 285
	i32 530272170, ; 75: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 538707440, ; 76: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 316
	i32 539058512, ; 77: Microsoft.Extensions.Logging => 0x20216150 => 193
	i32 540030774, ; 78: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 79: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 80: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 81: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 82: Jsr305Binding => 0x213954e7 => 278
	i32 569601784, ; 83: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 276
	i32 571435654, ; 84: Microsoft.Extensions.FileProviders.Embedded.dll => 0x220f6a86 => 190
	i32 577335427, ; 85: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 601371474, ; 86: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 87: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 88: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 89: Xamarin.AndroidX.CustomView => 0x2568904f => 230
	i32 627931235, ; 90: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 308
	i32 639843206, ; 91: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 236
	i32 643868501, ; 92: System.Net => 0x2660a755 => 81
	i32 662205335, ; 93: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 94: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 272
	i32 666292255, ; 95: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 217
	i32 672442732, ; 96: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 97: System.Net.Security => 0x28bdabca => 73
	i32 690569205, ; 98: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 99: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 287
	i32 693804605, ; 100: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 101: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 102: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 282
	i32 700358131, ; 103: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 720511267, ; 104: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 286
	i32 722857257, ; 105: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 106: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 107: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 108: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 207
	i32 759454413, ; 109: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 110: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 111: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 112: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 314
	i32 789151979, ; 113: Microsoft.Extensions.Options => 0x2f0980eb => 196
	i32 790371945, ; 114: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 231
	i32 804008546, ; 115: Microsoft.AspNetCore.Components.WebView.Maui => 0x2fec3262 => 179
	i32 804715423, ; 116: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 117: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 245
	i32 823281589, ; 118: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 119: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 120: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 121: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 122: Xamarin.AndroidX.Print => 0x3246f6cd => 258
	i32 869139383, ; 123: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 299
	i32 873119928, ; 124: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 125: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 126: System.Net.Http.Json => 0x3463c971 => 63
	i32 880668424, ; 127: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 313
	i32 904024072, ; 128: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 129: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 918734561, ; 130: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 310
	i32 928116545, ; 131: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 281
	i32 952186615, ; 132: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 956575887, ; 133: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 286
	i32 961460050, ; 134: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 303
	i32 966729478, ; 135: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 279
	i32 967690846, ; 136: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 242
	i32 975236339, ; 137: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 138: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 139: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 140: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 990727110, ; 141: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 312
	i32 992768348, ; 142: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 143: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 999186168, ; 144: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 192
	i32 1001831731, ; 145: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 146: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 262
	i32 1019214401, ; 147: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 148: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 187
	i32 1031528504, ; 149: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 280
	i32 1035644815, ; 150: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 215
	i32 1036536393, ; 151: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1043950537, ; 152: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 293
	i32 1044663988, ; 153: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 154: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 249
	i32 1067306892, ; 155: GoogleGson => 0x3f9dcf8c => 173
	i32 1082857460, ; 156: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 157: Xamarin.Kotlin.StdLib => 0x409e66d8 => 283
	i32 1098259244, ; 158: System => 0x41761b2c => 164
	i32 1106973742, ; 159: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x41fb142e => 184
	i32 1108272742, ; 160: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 315
	i32 1117529484, ; 161: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 309
	i32 1118262833, ; 162: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 305
	i32 1121599056, ; 163: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 248
	i32 1127624469, ; 164: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 195
	i32 1149092582, ; 165: Xamarin.AndroidX.Window => 0x447dc2e6 => 275
	i32 1168523401, ; 166: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 311
	i32 1170634674, ; 167: System.Web.dll => 0x45c677b2 => 153
	i32 1173126369, ; 168: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 188
	i32 1175144683, ; 169: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 271
	i32 1178241025, ; 170: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 256
	i32 1204270330, ; 171: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 217
	i32 1208641965, ; 172: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 173: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1243150071, ; 174: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 276
	i32 1253011324, ; 175: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 176: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 291
	i32 1264511973, ; 177: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 266
	i32 1267360935, ; 178: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 270
	i32 1273260888, ; 179: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 222
	i32 1275534314, ; 180: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 287
	i32 1278448581, ; 181: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 214
	i32 1293217323, ; 182: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 233
	i32 1308624726, ; 183: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 300
	i32 1309188875, ; 184: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 185: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 275
	i32 1324164729, ; 186: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 187: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1336711579, ; 188: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 320
	i32 1364015309, ; 189: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 190: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 321
	i32 1376866003, ; 191: Xamarin.AndroidX.SavedState => 0x52114ed3 => 262
	i32 1379779777, ; 192: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 193: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 194: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 226
	i32 1408764838, ; 195: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 196: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 197: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 198: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 289
	i32 1434145427, ; 199: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 200: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 279
	i32 1439761251, ; 201: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 202: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 203: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1454105418, ; 204: Microsoft.Extensions.FileProviders.Composite => 0x56abe34a => 189
	i32 1457743152, ; 205: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 206: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 207: es\Microsoft.Maui.Controls.resources => 0x57152abe => 295
	i32 1461234159, ; 208: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 209: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 210: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 211: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 216
	i32 1470490898, ; 212: Microsoft.Extensions.Primitives => 0x57a5e912 => 197
	i32 1479771757, ; 213: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 214: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 215: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 216: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 263
	i32 1521091094, ; 217: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 192
	i32 1526286932, ; 218: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 319
	i32 1536373174, ; 219: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 220: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 221: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1546581739, ; 222: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x5c2ef6eb => 179
	i32 1550322496, ; 223: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1565862583, ; 224: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 225: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 226: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 227: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 228: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 232
	i32 1592978981, ; 229: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 230: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 280
	i32 1601112923, ; 231: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 232: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 233: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 234: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 252
	i32 1622358360, ; 235: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 236: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 274
	i32 1632842087, ; 237: Microsoft.Extensions.Configuration.Json => 0x61533167 => 185
	i32 1635184631, ; 238: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 236
	i32 1636350590, ; 239: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 229
	i32 1639515021, ; 240: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 241: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 242: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1654881142, ; 243: Microsoft.AspNetCore.Components.WebView => 0x62a37b76 => 178
	i32 1657153582, ; 244: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 245: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 268
	i32 1658251792, ; 246: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 277
	i32 1670060433, ; 247: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 224
	i32 1675553242, ; 248: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 249: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 250: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 251: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 252: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 253: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 254: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 284
	i32 1701541528, ; 255: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 256: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 245
	i32 1721010838, ; 257: MataoMaps.Presentation.dll => 0x66948a96 => 0
	i32 1726116996, ; 258: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 259: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 260: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 220
	i32 1743415430, ; 261: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 290
	i32 1744735666, ; 262: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746115085, ; 263: System.IO.Pipelines.dll => 0x68139a0d => 205
	i32 1746316138, ; 264: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 265: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 266: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1760259689, ; 267: Microsoft.AspNetCore.Components.Web.dll => 0x68eb6e69 => 177
	i32 1763938596, ; 268: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 269: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 270: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 267
	i32 1770582343, ; 271: Microsoft.Extensions.Logging.dll => 0x6988f147 => 193
	i32 1776026572, ; 272: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 273: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 274: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 275: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 306
	i32 1788241197, ; 276: Xamarin.AndroidX.Fragment => 0x6a96652d => 238
	i32 1793755602, ; 277: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 298
	i32 1808609942, ; 278: Xamarin.AndroidX.Loader => 0x6bcd3296 => 252
	i32 1813058853, ; 279: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 283
	i32 1813201214, ; 280: Xamarin.Google.Android.Material => 0x6c13413e => 277
	i32 1818569960, ; 281: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 257
	i32 1818787751, ; 282: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 283: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 284: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 285: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 194
	i32 1847515442, ; 286: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 207
	i32 1853025655, ; 287: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 315
	i32 1858542181, ; 288: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 289: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 290: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 297
	i32 1879696579, ; 291: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 292: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 218
	i32 1888955245, ; 293: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 294: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1893218855, ; 295: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 291
	i32 1898237753, ; 296: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 297: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 298: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 299: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1953182387, ; 300: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 302
	i32 1956758971, ; 301: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 302: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 264
	i32 1968388702, ; 303: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 181
	i32 1983156543, ; 304: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 284
	i32 1985761444, ; 305: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 209
	i32 2003115576, ; 306: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 294
	i32 2011961780, ; 307: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 308: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 249
	i32 2031763787, ; 309: Xamarin.Android.Glide => 0x791a414b => 206
	i32 2045470958, ; 310: System.Private.Xml => 0x79eb68ee => 88
	i32 2048278909, ; 311: Microsoft.Extensions.Configuration.Binder.dll => 0x7a16417d => 183
	i32 2055257422, ; 312: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 244
	i32 2060060697, ; 313: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 314: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 293
	i32 2070888862, ; 315: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2072397586, ; 316: Microsoft.Extensions.FileProviders.Physical => 0x7b864712 => 191
	i32 2079903147, ; 317: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 318: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2127167465, ; 319: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 320: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 321: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 322: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 323: Microsoft.Maui => 0x80bd55ad => 202
	i32 2169148018, ; 324: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 301
	i32 2181898931, ; 325: Microsoft.Extensions.Options.dll => 0x820d22b3 => 196
	i32 2192057212, ; 326: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 194
	i32 2193016926, ; 327: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 328: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 288
	i32 2201231467, ; 329: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 330: it\Microsoft.Maui.Controls.resources => 0x839595db => 303
	i32 2217644978, ; 331: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 271
	i32 2222056684, ; 332: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2244775296, ; 333: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 253
	i32 2252106437, ; 334: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 335: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 336: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 337: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 182
	i32 2267999099, ; 338: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 208
	i32 2279755925, ; 339: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 260
	i32 2293034957, ; 340: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 341: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 342: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 343: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 307
	i32 2305521784, ; 344: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 345: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 212
	i32 2320631194, ; 346: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 347: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 348: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 349: System.Net.Primitives => 0x8c40e0db => 70
	i32 2366048013, ; 350: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 301
	i32 2368005991, ; 351: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 352: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 181
	i32 2374357174, ; 353: MataoMaps.Presentation => 0x8d85d0b6 => 0
	i32 2378619854, ; 354: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 355: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 356: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 302
	i32 2401565422, ; 357: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 358: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 235
	i32 2411328690, ; 359: Microsoft.AspNetCore.Components => 0x8fb9f4b2 => 175
	i32 2421380589, ; 360: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 361: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 222
	i32 2427813419, ; 362: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 299
	i32 2435356389, ; 363: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 364: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2442556106, ; 365: Microsoft.JSInterop.dll => 0x919672ca => 198
	i32 2454642406, ; 366: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 367: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 368: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 369: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 225
	i32 2471841756, ; 370: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 371: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 372: Microsoft.Maui.Controls => 0x93dba8a1 => 200
	i32 2483903535, ; 373: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 374: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 375: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 376: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2503351294, ; 377: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 305
	i32 2505896520, ; 378: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 247
	i32 2522472828, ; 379: Xamarin.Android.Glide.dll => 0x9659e17c => 206
	i32 2537015816, ; 380: Microsoft.AspNetCore.Authorization => 0x9737ca08 => 174
	i32 2538310050, ; 381: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 382: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 300
	i32 2562349572, ; 383: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 384: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2576534780, ; 385: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 304
	i32 2581783588, ; 386: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 248
	i32 2581819634, ; 387: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 270
	i32 2585220780, ; 388: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 389: System.Net.Ping => 0x9a20430d => 69
	i32 2585813321, ; 390: Microsoft.AspNetCore.Components.Forms => 0x9a206149 => 176
	i32 2589602615, ; 391: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2592341985, ; 392: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 188
	i32 2593496499, ; 393: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 309
	i32 2605712449, ; 394: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 288
	i32 2615233544, ; 395: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 239
	i32 2616218305, ; 396: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 195
	i32 2617129537, ; 397: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 398: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 399: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 229
	i32 2624644809, ; 400: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 234
	i32 2626831493, ; 401: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 304
	i32 2627185994, ; 402: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 403: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 404: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 243
	i32 2663391936, ; 405: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 208
	i32 2663698177, ; 406: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 407: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 408: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 409: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 410: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2692077919, ; 411: Microsoft.AspNetCore.Components.WebView.dll => 0xa075d95f => 178
	i32 2693849962, ; 412: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 413: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 268
	i32 2715334215, ; 414: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 415: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 416: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 417: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 418: Xamarin.AndroidX.Activity => 0xa2e0939b => 210
	i32 2735172069, ; 419: System.Threading.Channels => 0xa30769e5 => 139
	i32 2735631878, ; 420: Microsoft.AspNetCore.Authorization.dll => 0xa30e6e06 => 174
	i32 2737747696, ; 421: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 216
	i32 2740698338, ; 422: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 290
	i32 2740948882, ; 423: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 424: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 425: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 310
	i32 2758225723, ; 426: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 201
	i32 2764765095, ; 427: Microsoft.Maui.dll => 0xa4caf7a7 => 202
	i32 2765824710, ; 428: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 429: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 282
	i32 2778768386, ; 430: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 273
	i32 2779977773, ; 431: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 261
	i32 2785988530, ; 432: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 316
	i32 2788224221, ; 433: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 239
	i32 2801831435, ; 434: Microsoft.Maui.Graphics => 0xa7008e0b => 204
	i32 2803228030, ; 435: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2810250172, ; 436: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 226
	i32 2819470561, ; 437: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 438: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 439: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 261
	i32 2824502124, ; 440: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2833784645, ; 441: Microsoft.AspNetCore.Metadata => 0xa8e81f45 => 180
	i32 2838993487, ; 442: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 250
	i32 2849599387, ; 443: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 444: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 273
	i32 2855708567, ; 445: Xamarin.AndroidX.Transition => 0xaa36a797 => 269
	i32 2861098320, ; 446: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 447: Microsoft.Maui.Essentials => 0xaa8a4878 => 203
	i32 2870099610, ; 448: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 211
	i32 2875164099, ; 449: Jsr305Binding.dll => 0xab5f85c3 => 278
	i32 2875220617, ; 450: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 451: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 237
	i32 2887636118, ; 452: System.Net.dll => 0xac1dd496 => 81
	i32 2892341533, ; 453: Microsoft.AspNetCore.Components.Web => 0xac65a11d => 177
	i32 2899753641, ; 454: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 455: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 456: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 457: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 458: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2911054922, ; 459: Microsoft.Extensions.FileProviders.Physical.dll => 0xad832c4a => 191
	i32 2916838712, ; 460: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 274
	i32 2919462931, ; 461: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 462: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 213
	i32 2936416060, ; 463: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 464: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 465: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 466: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 467: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 468: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 469: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 233
	i32 2987532451, ; 470: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 264
	i32 2996846495, ; 471: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 246
	i32 3016983068, ; 472: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 266
	i32 3023353419, ; 473: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 474: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 241
	i32 3038032645, ; 475: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 323
	i32 3053864966, ; 476: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 296
	i32 3056245963, ; 477: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 263
	i32 3057625584, ; 478: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 254
	i32 3059408633, ; 479: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 480: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 481: System.Threading.Tasks => 0xb755818f => 144
	i32 3090735792, ; 482: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 483: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 484: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 485: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 486: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 487: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 488: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 489: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 490: GoogleGson.dll => 0xbba64c02 => 173
	i32 3159123045, ; 491: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 492: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 493: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 255
	i32 3192346100, ; 494: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 495: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 496: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 497: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 498: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 232
	i32 3220365878, ; 499: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 500: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 501: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 502: Xamarin.AndroidX.CardView => 0xc235e84d => 220
	i32 3265493905, ; 503: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 504: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 505: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 506: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 507: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 508: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 509: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 510: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 511: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 296
	i32 3316684772, ; 512: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 513: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 230
	i32 3317144872, ; 514: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 515: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 218
	i32 3345895724, ; 516: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 259
	i32 3346324047, ; 517: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 256
	i32 3357674450, ; 518: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 313
	i32 3358260929, ; 519: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 520: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 211
	i32 3362522851, ; 521: Xamarin.AndroidX.Core => 0xc86c06e3 => 227
	i32 3366347497, ; 522: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 523: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 260
	i32 3381016424, ; 524: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 292
	i32 3395150330, ; 525: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 526: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 527: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 231
	i32 3406629867, ; 528: Microsoft.Extensions.FileProviders.Composite.dll => 0xcb0d0beb => 189
	i32 3421170118, ; 529: Microsoft.Extensions.Configuration.Binder => 0xcbeae9c6 => 183
	i32 3428513518, ; 530: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 186
	i32 3429136800, ; 531: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 532: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 533: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 234
	i32 3445260447, ; 534: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 535: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 199
	i32 3458724246, ; 536: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 311
	i32 3464190856, ; 537: Microsoft.AspNetCore.Components.Forms.dll => 0xce7b5b88 => 176
	i32 3471940407, ; 538: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 539: Mono.Android => 0xcf3163e6 => 171
	i32 3484440000, ; 540: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 312
	i32 3485117614, ; 541: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 542: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 543: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 223
	i32 3500000672, ; 544: Microsoft.JSInterop => 0xd09dc5a0 => 198
	i32 3509114376, ; 545: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 546: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 547: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 548: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 549: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 550: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 551: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 320
	i32 3592228221, ; 552: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 322
	i32 3597029428, ; 553: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 209
	i32 3598340787, ; 554: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 555: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 556: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 557: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 258
	i32 3633644679, ; 558: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 213
	i32 3638274909, ; 559: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 560: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 244
	i32 3643446276, ; 561: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 317
	i32 3643854240, ; 562: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 255
	i32 3645089577, ; 563: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 564: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 182
	i32 3660523487, ; 565: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 566: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 567: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 219
	i32 3684561358, ; 568: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 223
	i32 3700866549, ; 569: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 570: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 228
	i32 3716563718, ; 571: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 572: Xamarin.AndroidX.Annotation => 0xdda814c6 => 212
	i32 3722202641, ; 573: Microsoft.Extensions.Configuration.Json.dll => 0xdddc4e11 => 185
	i32 3724971120, ; 574: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 254
	i32 3732100267, ; 575: System.Net.NameResolution => 0xde7354ab => 67
	i32 3732214720, ; 576: Microsoft.AspNetCore.Metadata.dll => 0xde7513c0 => 180
	i32 3737834244, ; 577: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 578: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 579: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3751619990, ; 580: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 292
	i32 3758424670, ; 581: Microsoft.Extensions.Configuration.FileExtensions => 0xe005025e => 184
	i32 3786282454, ; 582: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 221
	i32 3792276235, ; 583: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 584: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 199
	i32 3802395368, ; 585: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 586: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 587: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 588: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 589: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 187
	i32 3844307129, ; 590: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 591: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 592: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 593: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 594: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 595: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 596: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 269
	i32 3888767677, ; 597: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 259
	i32 3896106733, ; 598: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 599: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 227
	i32 3901907137, ; 600: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920221145, ; 601: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 308
	i32 3920810846, ; 602: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 603: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 272
	i32 3928044579, ; 604: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 605: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 606: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 257
	i32 3945713374, ; 607: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 608: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 609: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 215
	i32 3959773229, ; 610: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 246
	i32 4003436829, ; 611: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 612: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 214
	i32 4023392905, ; 613: System.IO.Pipelines => 0xefd01a89 => 205
	i32 4025784931, ; 614: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 615: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 201
	i32 4054681211, ; 616: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 617: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 618: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4091086043, ; 619: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 294
	i32 4094352644, ; 620: Microsoft.Maui.Essentials.dll => 0xf40add04 => 203
	i32 4099507663, ; 621: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 622: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 623: Xamarin.AndroidX.Emoji2 => 0xf479582c => 235
	i32 4103439459, ; 624: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 318
	i32 4126470640, ; 625: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 186
	i32 4127667938, ; 626: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 627: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 628: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 629: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 318
	i32 4151237749, ; 630: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 631: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 632: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 633: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 634: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 635: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 251
	i32 4185676441, ; 636: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 637: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 638: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4249188766, ; 639: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 307
	i32 4256097574, ; 640: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 228
	i32 4258378803, ; 641: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 250
	i32 4260525087, ; 642: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 643: Microsoft.Maui.Controls.dll => 0xfea12dee => 200
	i32 4274976490, ; 644: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 645: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 251
	i32 4294648842, ; 646: Microsoft.Extensions.FileProviders.Embedded => 0xfffb240a => 190
	i32 4294763496 ; 647: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 237
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [648 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 247, ; 3
	i32 281, ; 4
	i32 48, ; 5
	i32 289, ; 6
	i32 80, ; 7
	i32 298, ; 8
	i32 145, ; 9
	i32 30, ; 10
	i32 322, ; 11
	i32 124, ; 12
	i32 204, ; 13
	i32 102, ; 14
	i32 306, ; 15
	i32 265, ; 16
	i32 107, ; 17
	i32 265, ; 18
	i32 139, ; 19
	i32 285, ; 20
	i32 321, ; 21
	i32 314, ; 22
	i32 77, ; 23
	i32 124, ; 24
	i32 13, ; 25
	i32 221, ; 26
	i32 132, ; 27
	i32 267, ; 28
	i32 151, ; 29
	i32 18, ; 30
	i32 219, ; 31
	i32 26, ; 32
	i32 241, ; 33
	i32 1, ; 34
	i32 59, ; 35
	i32 42, ; 36
	i32 91, ; 37
	i32 175, ; 38
	i32 224, ; 39
	i32 147, ; 40
	i32 243, ; 41
	i32 240, ; 42
	i32 54, ; 43
	i32 69, ; 44
	i32 319, ; 45
	i32 210, ; 46
	i32 83, ; 47
	i32 297, ; 48
	i32 242, ; 49
	i32 131, ; 50
	i32 55, ; 51
	i32 149, ; 52
	i32 74, ; 53
	i32 145, ; 54
	i32 62, ; 55
	i32 146, ; 56
	i32 323, ; 57
	i32 165, ; 58
	i32 317, ; 59
	i32 225, ; 60
	i32 12, ; 61
	i32 238, ; 62
	i32 125, ; 63
	i32 152, ; 64
	i32 113, ; 65
	i32 166, ; 66
	i32 164, ; 67
	i32 240, ; 68
	i32 253, ; 69
	i32 295, ; 70
	i32 84, ; 71
	i32 197, ; 72
	i32 150, ; 73
	i32 285, ; 74
	i32 60, ; 75
	i32 316, ; 76
	i32 193, ; 77
	i32 51, ; 78
	i32 103, ; 79
	i32 114, ; 80
	i32 40, ; 81
	i32 278, ; 82
	i32 276, ; 83
	i32 190, ; 84
	i32 120, ; 85
	i32 52, ; 86
	i32 44, ; 87
	i32 119, ; 88
	i32 230, ; 89
	i32 308, ; 90
	i32 236, ; 91
	i32 81, ; 92
	i32 136, ; 93
	i32 272, ; 94
	i32 217, ; 95
	i32 8, ; 96
	i32 73, ; 97
	i32 155, ; 98
	i32 287, ; 99
	i32 154, ; 100
	i32 92, ; 101
	i32 282, ; 102
	i32 45, ; 103
	i32 286, ; 104
	i32 109, ; 105
	i32 129, ; 106
	i32 25, ; 107
	i32 207, ; 108
	i32 72, ; 109
	i32 55, ; 110
	i32 46, ; 111
	i32 314, ; 112
	i32 196, ; 113
	i32 231, ; 114
	i32 179, ; 115
	i32 22, ; 116
	i32 245, ; 117
	i32 86, ; 118
	i32 43, ; 119
	i32 160, ; 120
	i32 71, ; 121
	i32 258, ; 122
	i32 299, ; 123
	i32 3, ; 124
	i32 42, ; 125
	i32 63, ; 126
	i32 313, ; 127
	i32 16, ; 128
	i32 53, ; 129
	i32 310, ; 130
	i32 281, ; 131
	i32 105, ; 132
	i32 286, ; 133
	i32 303, ; 134
	i32 279, ; 135
	i32 242, ; 136
	i32 34, ; 137
	i32 158, ; 138
	i32 85, ; 139
	i32 32, ; 140
	i32 312, ; 141
	i32 12, ; 142
	i32 51, ; 143
	i32 192, ; 144
	i32 56, ; 145
	i32 262, ; 146
	i32 36, ; 147
	i32 187, ; 148
	i32 280, ; 149
	i32 215, ; 150
	i32 35, ; 151
	i32 293, ; 152
	i32 58, ; 153
	i32 249, ; 154
	i32 173, ; 155
	i32 17, ; 156
	i32 283, ; 157
	i32 164, ; 158
	i32 184, ; 159
	i32 315, ; 160
	i32 309, ; 161
	i32 305, ; 162
	i32 248, ; 163
	i32 195, ; 164
	i32 275, ; 165
	i32 311, ; 166
	i32 153, ; 167
	i32 188, ; 168
	i32 271, ; 169
	i32 256, ; 170
	i32 217, ; 171
	i32 29, ; 172
	i32 52, ; 173
	i32 276, ; 174
	i32 5, ; 175
	i32 291, ; 176
	i32 266, ; 177
	i32 270, ; 178
	i32 222, ; 179
	i32 287, ; 180
	i32 214, ; 181
	i32 233, ; 182
	i32 300, ; 183
	i32 85, ; 184
	i32 275, ; 185
	i32 61, ; 186
	i32 112, ; 187
	i32 320, ; 188
	i32 57, ; 189
	i32 321, ; 190
	i32 262, ; 191
	i32 99, ; 192
	i32 19, ; 193
	i32 226, ; 194
	i32 111, ; 195
	i32 101, ; 196
	i32 102, ; 197
	i32 289, ; 198
	i32 104, ; 199
	i32 279, ; 200
	i32 71, ; 201
	i32 38, ; 202
	i32 32, ; 203
	i32 189, ; 204
	i32 103, ; 205
	i32 73, ; 206
	i32 295, ; 207
	i32 9, ; 208
	i32 123, ; 209
	i32 46, ; 210
	i32 216, ; 211
	i32 197, ; 212
	i32 9, ; 213
	i32 43, ; 214
	i32 4, ; 215
	i32 263, ; 216
	i32 192, ; 217
	i32 319, ; 218
	i32 31, ; 219
	i32 138, ; 220
	i32 92, ; 221
	i32 179, ; 222
	i32 93, ; 223
	i32 49, ; 224
	i32 141, ; 225
	i32 112, ; 226
	i32 140, ; 227
	i32 232, ; 228
	i32 115, ; 229
	i32 280, ; 230
	i32 157, ; 231
	i32 76, ; 232
	i32 79, ; 233
	i32 252, ; 234
	i32 37, ; 235
	i32 274, ; 236
	i32 185, ; 237
	i32 236, ; 238
	i32 229, ; 239
	i32 64, ; 240
	i32 138, ; 241
	i32 15, ; 242
	i32 178, ; 243
	i32 116, ; 244
	i32 268, ; 245
	i32 277, ; 246
	i32 224, ; 247
	i32 48, ; 248
	i32 70, ; 249
	i32 80, ; 250
	i32 126, ; 251
	i32 94, ; 252
	i32 121, ; 253
	i32 284, ; 254
	i32 26, ; 255
	i32 245, ; 256
	i32 0, ; 257
	i32 97, ; 258
	i32 28, ; 259
	i32 220, ; 260
	i32 290, ; 261
	i32 149, ; 262
	i32 205, ; 263
	i32 169, ; 264
	i32 4, ; 265
	i32 98, ; 266
	i32 177, ; 267
	i32 33, ; 268
	i32 93, ; 269
	i32 267, ; 270
	i32 193, ; 271
	i32 21, ; 272
	i32 41, ; 273
	i32 170, ; 274
	i32 306, ; 275
	i32 238, ; 276
	i32 298, ; 277
	i32 252, ; 278
	i32 283, ; 279
	i32 277, ; 280
	i32 257, ; 281
	i32 2, ; 282
	i32 134, ; 283
	i32 111, ; 284
	i32 194, ; 285
	i32 207, ; 286
	i32 315, ; 287
	i32 58, ; 288
	i32 95, ; 289
	i32 297, ; 290
	i32 39, ; 291
	i32 218, ; 292
	i32 25, ; 293
	i32 94, ; 294
	i32 291, ; 295
	i32 89, ; 296
	i32 99, ; 297
	i32 10, ; 298
	i32 87, ; 299
	i32 302, ; 300
	i32 100, ; 301
	i32 264, ; 302
	i32 181, ; 303
	i32 284, ; 304
	i32 209, ; 305
	i32 294, ; 306
	i32 7, ; 307
	i32 249, ; 308
	i32 206, ; 309
	i32 88, ; 310
	i32 183, ; 311
	i32 244, ; 312
	i32 154, ; 313
	i32 293, ; 314
	i32 33, ; 315
	i32 191, ; 316
	i32 116, ; 317
	i32 82, ; 318
	i32 20, ; 319
	i32 11, ; 320
	i32 162, ; 321
	i32 3, ; 322
	i32 202, ; 323
	i32 301, ; 324
	i32 196, ; 325
	i32 194, ; 326
	i32 84, ; 327
	i32 288, ; 328
	i32 64, ; 329
	i32 303, ; 330
	i32 271, ; 331
	i32 143, ; 332
	i32 253, ; 333
	i32 157, ; 334
	i32 41, ; 335
	i32 117, ; 336
	i32 182, ; 337
	i32 208, ; 338
	i32 260, ; 339
	i32 131, ; 340
	i32 75, ; 341
	i32 66, ; 342
	i32 307, ; 343
	i32 172, ; 344
	i32 212, ; 345
	i32 143, ; 346
	i32 106, ; 347
	i32 151, ; 348
	i32 70, ; 349
	i32 301, ; 350
	i32 156, ; 351
	i32 181, ; 352
	i32 0, ; 353
	i32 121, ; 354
	i32 127, ; 355
	i32 302, ; 356
	i32 152, ; 357
	i32 235, ; 358
	i32 175, ; 359
	i32 141, ; 360
	i32 222, ; 361
	i32 299, ; 362
	i32 20, ; 363
	i32 14, ; 364
	i32 198, ; 365
	i32 135, ; 366
	i32 75, ; 367
	i32 59, ; 368
	i32 225, ; 369
	i32 167, ; 370
	i32 168, ; 371
	i32 200, ; 372
	i32 15, ; 373
	i32 74, ; 374
	i32 6, ; 375
	i32 23, ; 376
	i32 305, ; 377
	i32 247, ; 378
	i32 206, ; 379
	i32 174, ; 380
	i32 91, ; 381
	i32 300, ; 382
	i32 1, ; 383
	i32 136, ; 384
	i32 304, ; 385
	i32 248, ; 386
	i32 270, ; 387
	i32 134, ; 388
	i32 69, ; 389
	i32 176, ; 390
	i32 146, ; 391
	i32 188, ; 392
	i32 309, ; 393
	i32 288, ; 394
	i32 239, ; 395
	i32 195, ; 396
	i32 88, ; 397
	i32 96, ; 398
	i32 229, ; 399
	i32 234, ; 400
	i32 304, ; 401
	i32 31, ; 402
	i32 45, ; 403
	i32 243, ; 404
	i32 208, ; 405
	i32 109, ; 406
	i32 158, ; 407
	i32 35, ; 408
	i32 22, ; 409
	i32 114, ; 410
	i32 178, ; 411
	i32 57, ; 412
	i32 268, ; 413
	i32 144, ; 414
	i32 118, ; 415
	i32 120, ; 416
	i32 110, ; 417
	i32 210, ; 418
	i32 139, ; 419
	i32 174, ; 420
	i32 216, ; 421
	i32 290, ; 422
	i32 54, ; 423
	i32 105, ; 424
	i32 310, ; 425
	i32 201, ; 426
	i32 202, ; 427
	i32 133, ; 428
	i32 282, ; 429
	i32 273, ; 430
	i32 261, ; 431
	i32 316, ; 432
	i32 239, ; 433
	i32 204, ; 434
	i32 159, ; 435
	i32 226, ; 436
	i32 163, ; 437
	i32 132, ; 438
	i32 261, ; 439
	i32 161, ; 440
	i32 180, ; 441
	i32 250, ; 442
	i32 140, ; 443
	i32 273, ; 444
	i32 269, ; 445
	i32 169, ; 446
	i32 203, ; 447
	i32 211, ; 448
	i32 278, ; 449
	i32 40, ; 450
	i32 237, ; 451
	i32 81, ; 452
	i32 177, ; 453
	i32 56, ; 454
	i32 37, ; 455
	i32 97, ; 456
	i32 166, ; 457
	i32 172, ; 458
	i32 191, ; 459
	i32 274, ; 460
	i32 82, ; 461
	i32 213, ; 462
	i32 98, ; 463
	i32 30, ; 464
	i32 159, ; 465
	i32 18, ; 466
	i32 127, ; 467
	i32 119, ; 468
	i32 233, ; 469
	i32 264, ; 470
	i32 246, ; 471
	i32 266, ; 472
	i32 165, ; 473
	i32 241, ; 474
	i32 323, ; 475
	i32 296, ; 476
	i32 263, ; 477
	i32 254, ; 478
	i32 170, ; 479
	i32 16, ; 480
	i32 144, ; 481
	i32 125, ; 482
	i32 118, ; 483
	i32 38, ; 484
	i32 115, ; 485
	i32 47, ; 486
	i32 142, ; 487
	i32 117, ; 488
	i32 34, ; 489
	i32 173, ; 490
	i32 95, ; 491
	i32 53, ; 492
	i32 255, ; 493
	i32 129, ; 494
	i32 153, ; 495
	i32 24, ; 496
	i32 161, ; 497
	i32 232, ; 498
	i32 148, ; 499
	i32 104, ; 500
	i32 89, ; 501
	i32 220, ; 502
	i32 60, ; 503
	i32 142, ; 504
	i32 100, ; 505
	i32 5, ; 506
	i32 13, ; 507
	i32 122, ; 508
	i32 135, ; 509
	i32 28, ; 510
	i32 296, ; 511
	i32 72, ; 512
	i32 230, ; 513
	i32 24, ; 514
	i32 218, ; 515
	i32 259, ; 516
	i32 256, ; 517
	i32 313, ; 518
	i32 137, ; 519
	i32 211, ; 520
	i32 227, ; 521
	i32 168, ; 522
	i32 260, ; 523
	i32 292, ; 524
	i32 101, ; 525
	i32 123, ; 526
	i32 231, ; 527
	i32 189, ; 528
	i32 183, ; 529
	i32 186, ; 530
	i32 163, ; 531
	i32 167, ; 532
	i32 234, ; 533
	i32 39, ; 534
	i32 199, ; 535
	i32 311, ; 536
	i32 176, ; 537
	i32 17, ; 538
	i32 171, ; 539
	i32 312, ; 540
	i32 137, ; 541
	i32 150, ; 542
	i32 223, ; 543
	i32 198, ; 544
	i32 155, ; 545
	i32 130, ; 546
	i32 19, ; 547
	i32 65, ; 548
	i32 147, ; 549
	i32 47, ; 550
	i32 320, ; 551
	i32 322, ; 552
	i32 209, ; 553
	i32 79, ; 554
	i32 61, ; 555
	i32 106, ; 556
	i32 258, ; 557
	i32 213, ; 558
	i32 49, ; 559
	i32 244, ; 560
	i32 317, ; 561
	i32 255, ; 562
	i32 14, ; 563
	i32 182, ; 564
	i32 68, ; 565
	i32 171, ; 566
	i32 219, ; 567
	i32 223, ; 568
	i32 78, ; 569
	i32 228, ; 570
	i32 108, ; 571
	i32 212, ; 572
	i32 185, ; 573
	i32 254, ; 574
	i32 67, ; 575
	i32 180, ; 576
	i32 63, ; 577
	i32 27, ; 578
	i32 160, ; 579
	i32 292, ; 580
	i32 184, ; 581
	i32 221, ; 582
	i32 10, ; 583
	i32 199, ; 584
	i32 11, ; 585
	i32 78, ; 586
	i32 126, ; 587
	i32 83, ; 588
	i32 187, ; 589
	i32 66, ; 590
	i32 107, ; 591
	i32 65, ; 592
	i32 128, ; 593
	i32 122, ; 594
	i32 77, ; 595
	i32 269, ; 596
	i32 259, ; 597
	i32 8, ; 598
	i32 227, ; 599
	i32 2, ; 600
	i32 308, ; 601
	i32 44, ; 602
	i32 272, ; 603
	i32 156, ; 604
	i32 128, ; 605
	i32 257, ; 606
	i32 23, ; 607
	i32 133, ; 608
	i32 215, ; 609
	i32 246, ; 610
	i32 29, ; 611
	i32 214, ; 612
	i32 205, ; 613
	i32 62, ; 614
	i32 201, ; 615
	i32 90, ; 616
	i32 87, ; 617
	i32 148, ; 618
	i32 294, ; 619
	i32 203, ; 620
	i32 36, ; 621
	i32 86, ; 622
	i32 235, ; 623
	i32 318, ; 624
	i32 186, ; 625
	i32 50, ; 626
	i32 6, ; 627
	i32 90, ; 628
	i32 318, ; 629
	i32 21, ; 630
	i32 162, ; 631
	i32 96, ; 632
	i32 50, ; 633
	i32 113, ; 634
	i32 251, ; 635
	i32 130, ; 636
	i32 76, ; 637
	i32 27, ; 638
	i32 307, ; 639
	i32 228, ; 640
	i32 250, ; 641
	i32 7, ; 642
	i32 200, ; 643
	i32 110, ; 644
	i32 251, ; 645
	i32 190, ; 646
	i32 237 ; 647
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ f1b7113872c8db3dfee70d11925e81bb752dc8d0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
