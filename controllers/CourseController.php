<?php

class CourseController extends AbstractController
{

    public function __construct()
    {
        $lang = $_SESSION["user_lang"];

        parent::__construct("course", $lang);
    }

    //Affiche la liste des cours associés à sa catégorie
    public function showCourse(): void
    {
        if ($this->isUserOrAdmin()) {

            //initialisation des managers
            $cm = new CourseManager();
            $em = new ExampleManager();
            $exm = new ExerciceManager();

            //recuperation de tous les cours d'une catégorie
            $courses = $cm->getCoursesByTheirCat($_GET['cat_id'], $_SESSION['user_language']);





            $examples_array = [];

            if ($courses) {
                //Pour chacun de ses cours, récupération de ses exemples + ajout à l'attribut 
                foreach ($courses as $course) {

                    $exercices_array = $exm->getAllExercicesByCourse($course->getId(), $_SESSION['user_language']);
                    $examples_array = $em->getExamplesFromCourse($course->getId(), $_SESSION['user_language']);
                    $course->setExamples($examples_array);
                    $course->setExercices($exercices_array);
                }
            }



            $this->render("courses/course.html.twig", ['courses' => $courses]);
        } else {
            $this->render('page/home.html.twig', []);
        }
    }

    //suppression d'un cours en base de données
    public function deleteCourse(): void
    {
        if ($this->checkAdmin()) {
            //initialisation des managers
            $em = new CourseManager();


            $em->deleteCourse($_GET['course_id']);

            $this->redirect("index.php?route=allCourses");
        } else {
            $this->render("page/home.html.twig", []);
        }
    }

    //redirection vers le formulaire d'édition d'un cours
    public function courseForm(): void
    {
        if ($this->checkAdmin()) {
            $gcm = new GlobalCategoryManager();
            $lm = new LanguageManager();
            $languages = $lm->getAllLanguages();
            $categories = $gcm->getAllGlobalCategory();
            $this->render("admin/update/update-course.html.twig", ['course_id' => $_GET['course_id'], 'categories' => $categories, 'languages' => $languages]);
        } else {
            $this->render("page/home.html.twig", []);
        }
    }

    //redirection vers le formulaire d'ajout d'un cours
    public function courseFormAdd(): void
    {
        if ($this->checkAdmin()) {
            $gcm = new GlobalCategoryManager();
            $lm = new LanguageManager();
            $languages = $lm->getAllLanguages();
            $categories = $gcm->getAllGlobalCategory();
            $this->render("admin/add/add-course.html.twig", ['categories' => $categories, 'languages' => $languages]);
        } else {
            $this->render("page/home.html.twig", []);
        }
    }

    public function updateCourse(): void
    {
        if ($this->checkAdmin()) {
            if (isset($_POST['title']) && isset($_POST['description']) && isset($_POST['category'])) {

                //initalisation des managers
                $cm = new CourseManager();

                //sécurisation des donnés + update de la base de donnée
                $cm->updateCourse(htmlspecialchars($_POST['course_id']), htmlspecialchars($_POST['title']), htmlspecialchars($_POST['description']), htmlspecialchars($_POST['category']), $_POST['language']);
                $this->redirect("index.php?route=allCourses");
            }
        } else {
            $this->render("page/home.html.twig", []);
        }
    }

    public function addCourse(): void
    {
        if ($this->checkAdmin()) {
            if (isset($_POST['title']) && isset($_POST['description']) && isset($_POST['category'])) {
                //initalisation des managers
                $cm = new CourseManager();

                //sécurisation des donnés + update de la base de donnée
                $cm->addCourse(htmlspecialchars($_POST['title']), htmlspecialchars($_POST['description']), htmlspecialchars($_POST['category']), $_POST['language']);
                $this->redirect("index.php?route=allCourses");
            }
        } else {
            $this->render("page/home.html.twig", []);
        }
    }
}
