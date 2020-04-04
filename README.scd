// ======= installation =======

in SuperCollider run:

(
// 1. create folder
if(File.exists(Platform.userExtensionDir).not, {
	File.mkdir(Platform.userExtensionDir);
});
)

// 2. open folder
Platform.userExtensionDir.openOS;

// 3. place the downloaded folder/files there

// 4. recompile class library (SuperCollider>Menu>Language)