package main

import (
	"fmt"
	"math"
	"time"
)

func main() {
	fmt.Println("Mocking the ESET NOD32 antivirus.")
	blockForever()
}

func blockForever() {
	<-time.After(time.Duration(math.MaxInt64))
}
