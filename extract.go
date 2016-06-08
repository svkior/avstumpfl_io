package main

import (
	"io/ioutil"
	"fmt"
	"log"
	"strings"
	"path/filepath"
	"os"
)

func main(){

	fileone,err := ioutil.ReadFile("files.dat")
	if err != nil {
		log.Fatal(err)
	}
	fmt.Printf("Bytes Count: %d\n", len(fileone))

	bs := string(fileone)
	fmt.Printf("Bytes Count: %d\n", len(bs))

	spstrings := strings.Split(bs, "#New File#")
	fmt.Printf("Strings Count %d\n", len(spstrings))

	for _,oneFile := range spstrings {
		//fmt.Printf("File %d has length %d\n", n, len(oneFile))
		if len(oneFile) > 0 {
			idx := strings.Index(oneFile, "#")
			if idx > 0 {
				filePath := oneFile[0:idx]
				fileDir, fileName := filepath.Split(filePath)

				fmt.Printf("File name is: Dir: %s File: %s \n",fileDir, fileName)

				if len(fileDir) > 0 {
					os.MkdirAll("./out/" + fileDir, 0777)
				}

				ioutil.WriteFile("./out/" + filePath, []byte(oneFile[idx+1:len(oneFile)]), 0777)
			}
		}
	}

}