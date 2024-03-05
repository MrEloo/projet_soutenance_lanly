export function createResponse() {

    let response_data = {
        response: document.querySelector("input[name='response']").value,
        course_id: document.querySelector("input[name='course_id']").value
    }


    return response_data


}

