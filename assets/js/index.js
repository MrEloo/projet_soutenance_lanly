import { createResponse } from "./create-response.js";


document.addEventListener('DOMContentLoaded', function () {

    const questions = [];
    const questions_data = document.querySelectorAll('.question');
    const sendButton = document.querySelector('#sendButton');
    const urlParams = new URLSearchParams(window.location.search);
    const courseId = urlParams.get('course_id');
    const catId = urlParams.get('cat_id');
    const input = document.querySelector("#response")


    //On sauvegarde toutes les questions dans un tableau
    if (questions_data) {
        questions_data.forEach((question_data, index) => {
            questions.push(question_data);
        });
    }



    //Si la question n'est pas 0, elle sera invisible
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

    //On ajoute un écouteur d'évènement sur le boutton de soumission du formulaire
    if (sendButton) {
        sendButton.addEventListener('click', (e) => {

            //On empêche le rechargement de la page
            e.preventDefault();

            //A chaque soumission de formulaire, on stock la réponse dans un tableau
            result.push(createResponse())

            //On vide l'input
            input.value = '';

            //On cherche la question qui contient la classe "active"
            const currentQuestion = questions.find(question => question.classList.contains('active'));

            //si oui on trouve une question, on lui enleve la classe "active" et lui ajoute la classe "not active"
            if (currentQuestion) {

                //On cherche la position dans le tableau de la "currrent question"
                const currentIndex = questions.indexOf(currentQuestion);
                const current = questions[currentIndex];

                current.classList.remove('active');
                current.classList.add('not_active');

                //On cherche la question suivante
                const nextQuestion = questions[currentIndex + 1];
                const nextIndex = questions.indexOf(nextQuestion)

                //si on la trouve
                if (nextQuestion) {

                    //On lui ajoute et supprime les bonnes classes
                    nextQuestion.classList.add('active');
                    nextQuestion.classList.remove('not_active');

                    //Si c'est la derniere question du tableau, on ajoute la classe "last button"
                    if (nextIndex === questions.length - 1) {
                        sendButton.classList.add('lastButton')
                        sendButton.innerHTML = 'finish'
                    }
                } //sinon 
                else {
                    //Si on trouve un élément ayant la classe last button, on va pouvoir préparer le fetch
                    if (sendButton.classList.contains('lastButton')) {

                        //On créer une classe formData
                        const newFormData = new FormData();

                        //On lui ajoute toutes les réponses convertit en JSON
                        newFormData.append('response', 'ok');
                        newFormData.append('answers', JSON.stringify(result));


                        //On prépare les options
                        const options = {
                            method: "POST",
                            body: newFormData,
                        };

                        //On fetch les réponses à la bonne url
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
            console.log(localStorage)
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

