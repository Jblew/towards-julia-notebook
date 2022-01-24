import Pkg, PackageCompiler
Pkg.activate("TowardsNotebook")
Pkg.instantiate()
PackageCompiler.create_app("TowardsNotebook", "TowardsNotebookCompiled")