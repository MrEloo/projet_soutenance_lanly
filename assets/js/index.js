import { createResponse } from "./create-response.js";


document.addEventListener('DOMContentLoaded', function () {

    const questions = [];
    const questions_data = document.querySelectorAll('.question');
    const sendButton = document.querySelector('#sendButton');
    const urlParams = new URLSearchParams(window.location.search);
    const courseId = urlParams.get('course_id');
    const catId = urlParams.get('cat_id');
    const input = document.querySelector("#response")


    if (questions_data) {
        questions_data.forEach((question_data, index) => {
            questions.push(question_data);
        });
    }




    if (questions) {
        questions.forEach((question, index) => {
            if (index !== 0) {
                question.classList.add('not_active')
            } else {
                question.classList.add('active')
            }
        })
    }


    const result = [];

    if (sendButton) {
        sendButton.addEventListener('click', (e) => {

            e.preventDefault();

            result.push(createResponse())

            input.value = '';

            const currentQuestion = questions.find(question => question.classList.contains('active'));

            if (currentQuestion) {


                const currentIndex = questions.indexOf(currentQuestion);
                const current = questions[currentIndex];

                current.classList.remove('active');
                current.classList.add('not_active');

                const nextQuestion = questions[currentIndex + 1];
                const nextIndex = questions.indexOf(nextQuestion)


                if (nextQuestion) {

                    nextQuestion.classList.add('active');
                    nextQuestion.classList.remove('not_active');

                    if (nextIndex === questions.length - 1) {
                        sendButton.classList.add('lastButton')
                        sendButton.innerHTML = 'finish'
                    }
                } else {
                    if (sendButton.classList.contains('lastButton')) {

                        const newFormData = new FormData();


                        newFormData.append('response', 'ok');
                        newFormData.append('answers', JSON.stringify(result));



                        const options = {
                            method: "POST",
                            body: newFormData,
                        };


                        fetch(`index.php?route=checkResponse&course_id=${courseId}`, options)
                            .then(response => response.json())
                            .then(data => {
                                console.log(data);
                                window.location.href = `index.php?route=ex_res&course_id=${courseId}&cat_id=${catId}`


                            })


                    }
                }
            }
        });
    }

    const increase = document.getElementById("increase");
    const decrease = document.getElementById("decrease");
    const resetButton = document.getElementById("reset");
    const htmlElement = document.querySelector('html');
    const baseFontSize = 16; // Taille de police de base en pixels (correspondant à 100%)


    // Fonction pour augmenter la taille de la police
    function increasePoliceSize() {
        const currentFontSize = parseFloat(window.getComputedStyle(htmlElement).fontSize);
        const newSize = currentFontSize + 1;
        if (newSize <= maxFontSize) {
            htmlElement.style.fontSize = newSize / baseFontSize * 100 + "%";
            localStorage.setItem('fontSize', newSize); // Enregistrer la nouvelle taille dans le stockage local
        }
    }

    function resetPoliceSize() {
        const pourcentageSize = 62.5;
        htmlElement.style.fontSize = pourcentageSize + "%";
        localStorage.removeItem('fontSize'); // Supprimer la taille enregistrée dans le stockage local
    }

    // Fonction pour diminuer la taille de la police
    function decreasePoliceSize() {
        const currentFontSize = parseFloat(window.getComputedStyle(htmlElement).fontSize);
        const newSize = currentFontSize - 1;
        if (newSize >= minFontSize) {
            htmlElement.style.fontSize = newSize / baseFontSize * 100 + "%";
            localStorage.setItem('fontSize', newSize); // Enregistrer la nouvelle taille dans le stockage local
        }
    }


    // Taille de police maximale et minimale
    const maxFontSize = 15; // Taille de police maximale
    const minFontSize = 10; // Taille de police minimale

    // Récupérer la taille de police précédemment enregistrée depuis le stockage local
    const storedFontSize = localStorage.getItem('fontSize');
    if (storedFontSize) {
        const htmlElement = document.querySelector('html');
        const baseFontSize = 16; // Taille de police de base en pixels (correspondant à 100%)
        htmlElement.style.fontSize = storedFontSize / baseFontSize * 100 + "%";
    }

    // Écouteurs d'événements pour les boutons d'augmentation et de diminution de la police
    increase.addEventListener('click', increasePoliceSize);
    decrease.addEventListener('click', decreasePoliceSize);
    resetButton.addEventListener('click', resetPoliceSize)


});

