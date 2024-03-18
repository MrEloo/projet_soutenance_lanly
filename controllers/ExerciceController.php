<?php


class ExerciceController extends AbstractController
{

    //////////////////////////////////////////////////////////////
    //LES EXERCICES SONT COMPOSE D'UN ENSEMBLE DE QUESTION////////
    //////////////////////////////////////////////////////////////

    //Affiche tous les exercices d'une catégorie selon l'utilisateur afin d'afficher les progressions de chacuns
    public function showExercices(): void
    {
        if ($this->isUserOrAdmin()) {

            //initialisation des managers
            $em = new ExerciceManager();
            $cm = new CourseManager();

            $userCourse_array = [];

            //Recuperation des cours d'une catégories
            $courses = $cm->getCoursesByTheirCat($_GET['cat_id'], $_SESSION['user_language']);


            foreach ($courses as $course) {

                //Afin d'individualisé chaque utilisateur, on va devoir récupérer les informations de la table users_courses

                //On regarde pour cahque cours si l'utilisateur à une ligne dans la table users_courses
                $userFinishedCourses = $cm->getCourseByUser($_SESSION['user_id'], $course->getId(), $_SESSION['user_language']);

                //Si non, on l'a creer
                if (!$userFinishedCourses) {
                    $cm->addCourseInUsersCourses($_SESSION['user_id'], $course->getId());
                }

                //Afin d'afficher les cours, on va récupérer dans cette même table, tous les cours d'un utilisateur que l'on stock dans un tableau
                $userCourses = $cm->getCourseFromUserById($_SESSION['user_id'], $course->getId());

                $userCourse_array[] = $userCourses;
            }


            //Pour chacun des cours de la catégorie, on va chercher ses exercices, que l'on ajoute à l'attribut dans le modele course
            foreach ($userCourse_array as $key => $userCourse) {
                $exercices = $em->getAllExercicesByCourse($userCourse->getId(), $_SESSION['user_language']);
                $userCourse->setExercices($exercices);
            }



            $this->render("exercices/exercices.html.twig", ['courses' => $userCourse_array]);
        } else {
            $this->render("page/home.html.twig", []);
        }
    }

    //Affiche la liste de tous les exercices d'un cours
    public function showExercice(): void
    {
        if ($this->isUserOrAdmin()) {

            //initilisation des managers
            $em = new ExerciceManager();

            //Récupération de toutes les questions d'un cours
            $exercice = $em->getAllExercicesByCourse($_GET['course_id'], $_SESSION['user_language']);
            $this->render("exercices/exercice.html.twig", ['exercice' => $exercice]);
        } else {
            $this->render("page/home.html.twig", []);
        }
    }

    //suppression d'un exemple en base de données
    public function deleteExercice(): void
    {
        if ($this->isUserOrAdmin()) {
            $em = new ExerciceManager();
            $em->deleteExercice($_GET['ex_id']);
            $this->redirect("index.php?route=allExercices");
        } else {
            $this->render("page/home.html.twig", []);
        }
    }

    //redirection vers le formulaire d'édition D UNE QUESTION
    public function exerciceForm(): void
    {
        if ($this->isUserOrAdmin()) {
            $this->render("admin/update/update-exercice.html.twig", ['exercice_id' => $_GET['ex_id']]);
        } else {
            $this->render("page/home.html.twig", []);
        }
    }


    public function updateExercice(): void
    {
        if ($this->isUserOrAdmin()) {
            if (isset($_POST['title']) && isset($_POST['difficulty']) && isset($_POST['question']) && isset($_POST['correction_text']) && isset($_POST['correction_word']) && isset($_POST['global_category_id']) && isset($_POST['course_id'])) {

                //initalisation des managers
                $em = new ExerciceManager();

                //sécurisation des donnés + update de la base de donnée
                $em->updateExercice($_POST['exercice_id'], htmlspecialchars($_POST['title']), htmlspecialchars($_POST['difficulty']), htmlspecialchars($_POST['question']), htmlspecialchars($_POST['correction_text']), htmlspecialchars($_POST['correction_word']), htmlspecialchars($_POST['global_category_id']), htmlspecialchars($_POST['course_id']));
                $this->redirect("index.php?route=allExercices");
            }
        } else {
            $this->render("page/home.html.twig", []);
        }
    }

    //redirection vers le formulaire d'ajout d'une QUESTION
    public function exerciceFormAdd(): void
    {
        if ($this->isUserOrAdmin()) {
            $this->render("admin/add/add-exercice.html.twig", []);
        } else {
            $this->render("page/home.html.twig", []);
        }
    }


    public function addExercice(): void
    {
        if ($this->isUserOrAdmin()) {
            if (isset($_POST['title']) && isset($_POST['difficulty']) && isset($_POST['question']) && isset($_POST['correction_text']) && isset($_POST['correction_word']) && isset($_POST['global_category_id']) && isset($_POST['course_id'])) {

                //initalisation des managers
                $em = new ExerciceManager();

                //sécurisation des donnés + update de la base de donnée
                $em->addExercice(htmlspecialchars($_POST['title']), htmlspecialchars($_POST['difficulty']), htmlspecialchars($_POST['question']), htmlspecialchars($_POST['correction_text']), htmlspecialchars($_POST['correction_word']), htmlspecialchars($_POST['global_category_id']), htmlspecialchars($_POST['course_id']), $_POST['language']);
                $this->redirect("index.php?route=allExercices");
            }
        } else {
            $this->render("page/home.html.twig", []);
        }
    }
}
