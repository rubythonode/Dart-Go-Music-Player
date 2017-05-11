package main

import (
	"log"
	"net/http"
)
func main() {
	host := "2601:247:c303:d820:6ec2:17ff:fe61:aeb8"
	port := "8000"
	serviceUrl := "[" + host + "]:" + port
	log.Println("Opening filename service...")
	mux := new(http.ServeMux)
	mux.HandleFunc("/api/filelist", ListService)

	if err := http.ListenAndServe(serviceUrl, mux); err != nil {
		log.Fatalln("Go service error:", err)
	}
}
