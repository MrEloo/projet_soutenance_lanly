
const inputFile = document.querySelector('#input_file')
const button = document.querySelector('#button_send_image')
const label = document.querySelector('.label_image')




if (inputFile) {
    inputFile.addEventListener('change', (e) => {
        button.classList.remove('button_send_image')
        button.classList.add('button_send_image_visible')

        label.style.display = 'none';
    })

}

















