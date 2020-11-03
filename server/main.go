package main

import (
	"net/http"

	"github.com/otiai10/marmoset"
)

func main() {
	marmoset.LoadViews("views")
	router := marmoset.NewRouter()
	router.GET("/", func(w http.ResponseWriter, r *http.Request) {
		marmoset.Render(w).HTML("index", nil)
	})
	router.Static("/public", "static")
	http.ListenAndServe(":8080", router)
}
