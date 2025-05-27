import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        console.log("Task controller connected");
    }
}