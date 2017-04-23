package main

import (
	"net/http"
	"io/ioutil"
	"encoding/json"
)

func ListService(w http.ResponseWriter, r *http.Request)  {
	var titles []string

	songPath := "./songs"

	dir, _ := ioutil.ReadDir(songPath)
	for _, songFile :=  range dir {
		titles = append(titles, songFile.Name())
	}
	data := struct {
		Songs []string `json:"songs"`

	}{
		Songs:titles,
	}
	json.NewEncoder(w).Encode(data)
}


