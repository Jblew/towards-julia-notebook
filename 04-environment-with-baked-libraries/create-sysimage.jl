import PackageCompiler
PackageCompiler.create_sysimage(["Plots", "Markdown", "DataFrames"]; sysimage_path = "DSSysimage.so")