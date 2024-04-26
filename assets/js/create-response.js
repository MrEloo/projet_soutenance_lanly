export function createResponse() {

    //on récupère les éléments du formaulaire de réponse, et on accède à leur valeur.

    let response_data = {
        response: document.querySelector("input[name='response']").value,
        course_id: document.querySelector("input[name='course_id']").value
    }


    return response_data


}

