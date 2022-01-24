using Pkg
Pkg.activate(".")
Pkg.precompile()

import TowardsNotebook
TowardsNotebook.notebook()