package main

import (
	"log"
	"net/http"
)
func main() {
	host := "10.0.0.6"
	port := "8000"
	serviceUrl := host + ":" + port
	log.Println("Opening filename service...")
	mux := new(http.ServeMux)
	mux.HandleFunc("/api/filelist", ListService)

	if err := http.ListenAndServe(serviceUrl, mux); err != nil {
		log.Fatalln("Go service error:", err)
	}
}
