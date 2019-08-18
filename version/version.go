package version

import (
	"fmt"
	"runtime"
)

// GitCommit that was compiled. This will be filled in by the compiler.
var GitCommit string

// Version number that is being run at the moment.
const Version = "0.1.0"

// BuildDate that the binary was compiled
var BuildDate = ""

// GoVersion from the runtime
var GoVersion = runtime.Version()

// OsArch is the architecture binary is compiled for
var OsArch = fmt.Sprintf("%s %s", runtime.GOOS, runtime.GOARCH)
