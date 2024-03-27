<?php

class PageController extends AbstractController
{

    public function __construct()
    {
        $lang = $_SESSION["user_lang"];

        parent::__construct("page", $lang);
    }


    public function home(): void
    {
        if ($this->isUserOrAdmin()) {

            // $gcm = new GlobalCategoryManager();
            // $cm = new CourseManager();

            // //recuperation de toutes les catégories
            // $global_categories = $gcm->getAllGlobalCategory();

            // //Pour chacune de ces catégories, on va chercher le nombre total de cours qu'il a, et le nombre de cours terminé par l'utilisateur sachant que pour finir un cours, il faut avoir répondu à toutes les QUESTIONS de ce cours
            // // Ce procesuss permet d'afficher la progression de chaque utilisateur
            // foreach ($global_categories as $key => $global_category) {
            //     $progression = 0;
            //     $totalCourse = $cm->getTotalCoursesByCatAndLang($global_category->getId(), $_SESSION['user_language']);
            //     $totalFinished =  $cm->getTotalFinishedCoursesByUser($global_category->getId(), $_SESSION['user_id'], $_SESSION['user_language']);
            //     if ($totalCourse > 0) {
            //         $progression = ($totalFinished / $totalCourse) * 100;
            //     }

            //     $global_category->setProgression($progression);
            // }

            $this->redirect("index.php?route=login_home");
        } else {

            //initialisation des managers
            $gcm = new GlobalCategoryManager();
            $languageManager = new LanguageManager();
            $cm = new CourseManager();

            //recuperation de toutes les catégories
            $global_categories = $gcm->getAllGlobalCategory();
            //recuperation de toutes les langues
            $languages = $languageManager->getAllLanguages();

            foreach ($languages as $key => $language) {
                $courses = $cm->getCoursesByLanguageId($language->getId());
                if ($courses) {
                    $language->setHasCourse(true);
                } else {
                    $language->setHasCourse(false);
                }
            }



            //Réinitialisation des sessions de messages d'erreur lors de l'inscription ou la connexion
            $_SESSION['erreur_hash'] = '';
            $_SESSION['erreur_mail'] = '';
            $_SESSION['erreur_remplissage'] = '';


            $this->render("page/home.html.twig", ['categories' => $global_categories, 'languages' => $languages]);
        }
    }

    public function loginHome(): void
    {
        if ($this->isUserOrAdmin()) {

            //initialisation des managers
            $gcm = new GlobalCategoryManager();
            $cm = new CourseManager();

            //recuperation de toutes les catégories
            $global_categories = $gcm->getAllGlobalCategory();

            //Pour chacune de ces catégories, on va chercher le nombre total de cours qu'il a, et le nombre de cours terminé par l'utilisateur sachant que pour finir un cours, il faut avoir répondu à toutes les QUESTIONS de ce cours
            // Ce procesuss permet d'afficher la progression de chaque utilisateur
            foreach ($global_categories as $key => $global_category) {
                $progression = 0;
                $totalCourse = $cm->getTotalCoursesByCatAndLang($global_category->getId(), $_SESSION['user_language']);
                $totalFinished =  $cm->getTotalFinishedCoursesByUser($global_category->getId(), $_SESSION['user_id'], $_SESSION['user_language']);
                if ($totalCourse > 0) {
                    $progression = ($totalFinished / $totalCourse) * 100;
                }

                $global_category->setProgression($progression);
            }



            // $int = $cm->getCountOffinishedCourseByUser();
            $this->render("page/login_home.html.twig", ['categories' => $global_categories]);
        } else {
            $this->render("page/home.html.twig", []);
        }
    }

    public function profil(): void
    {
        //Initialisation des managers
        if ($this->isUserOrAdmin()) {
            $um = new UserManager();
            $lm = new LanguageManager();
            $cm = new CountryManager();


            //Récupération de l'utilisateur grace à la session puis affichage de ces informations
            $user = $um->getUserByEmail($_SESSION['user_email']);
            $flag = $lm->getOneLanguageById($user->getLanguage()->getId());
            $country = $cm->getOneCountryById($user->getCountry()->getId());
            $flag_from = $lm->getOneLanguageById($country->getLanguage()->getId());
            $this->render("user/profil.html.twig", ['user' => $user, 'flag' => $flag, 'flag_from' => $flag_from]);
        } else {
            $this->render("page/home.html.twig", []);
        }
    }

    //affiche la liste des catégories d'exercices disponible
    public function showChoice(): void
    {
        if ($this->isUserOrAdmin()) {

            //Initialisation des managers
            $gcm = new GlobalCategoryManager();
            $cm = new CourseManager();

            $courses = $cm->getAllCourse($_GET['cat_id'], $_SESSION['user_language']);



            foreach ($courses as $course) {

                //On regarde pour cahque cours si l'utilisateur à une ligne dans la table users_courses
                $userFinishedCourses = $cm->getCourseByUser($_SESSION['user_id'], $course->getId(), $_SESSION['user_language']);

                //Afin d'afficher les cours, on va récupérer dans cette même table, tous les cours d'un utilisateur que l'on stock dans un tableau
                if (!$userFinishedCourses) {
                    $cm->addCourseInUsersCourses($_SESSION['user_id'], $course->getId());
                }
            }

            //Récuperation de la catégorie selon son id
            $category = $gcm->getOneCatById($_GET['cat_id']);

            $this->render("page/choice.html.twig", ['category' => $category]);
        } else {
            $this->render("page/home.html.twig", []);
        }
    }

    //Redirection vers la page ABOUT
    public function aboutPage(): void
    {
        $this->render("page/about.html.twig", []);
    }

    //Redirection vers la page CONTACT
    public function contactPage(): void
    {
        $this->render("page/contact.html.twig", []);
    }

    public function chosenLanguage(): void
    {
        if ($this->isUserOrAdmin()) {
            //Initialisation des managers
            $gcm = new GlobalCategoryManager();

            //Récuperation de toutes les catégories
            $global_categories = $gcm->getAllGlobalCategory();

            $this->render("page/login_home.html.twig", ['categories' => $global_categories]);
        } else {

            //Initialisation des managers
            $lm = new LanguageManager();

            //Si est présente dans la session la langue
            if (isset($_GET['language_id'])) {

                //récupération de la langue par son ID
                $langue = $lm->getOneLanguageById($_GET['language_id']);

                // Stocker la langue sélectionnée dans la session
                $_SESSION['selected_language'] = $langue->getDrapeau();
                $_SESSION['selected_language_name'] = $langue->getName();
            }



            $this->redirect("index.php", ['language' => $langue]);
        }
    }

    public function mentionPage(): void
    {
        $this->render("page/mentions.html.twig", []);
    }

    public function protectionPage(): void
    {
        $this->render("page/protection.html.twig", []);
    }
}
