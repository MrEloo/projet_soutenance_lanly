try {
    document.addEventListener('DOMContentLoaded', function () {
        const menu_burger = document.querySelector('.menu_burger');
        const modale = document.querySelector('.modale_burger_mobile');
        const closeModaleButton = document.querySelector("#close-modale");
        const overlay = document.querySelector('.overlay');

        menu_burger.addEventListener('click', (e) => {
            modale.classList.toggle('modale_burger_mobile');
            modale.classList.toggle('modale_burger_mobile_visible');
            overlay.classList.toggle('overlay_visible');
            overlay.classList.toggle('overlay');
        });

        closeModaleButton.addEventListener('click', (e) => {
            modale.classList.toggle('modale_burger_mobile');
            modale.classList.toggle('modale_burger_mobile_visible');
            overlay.classList.remove('overlay_visible');
            overlay.classList.add('overlay');
        });

        function closeFromEverywhere() {
            modale.classList.remove('modale_burger_mobile_visible');
            modale.classList.add('modale_burger_mobile');
            overlay.classList.remove('overlay_visible');
            overlay.classList.add('overlay');
        }

        document.addEventListener('click', (e) => {
            if (!modale.contains(e.target) && !menu_burger.contains(e.target)) {
                closeFromEverywhere();
            }
        });
    });
} catch (error) {
    console.error("Une erreur s'est produite : ", error);
}