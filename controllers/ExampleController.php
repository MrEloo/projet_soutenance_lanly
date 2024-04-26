<?php


class ExampleController extends AbstractController
{

    public function __construct()
    {
        $lang = $_SESSION["user_lang"];

        parent::__construct("example", $lang);
    }

    //suppression d'un exemple en base de données
    public function deleteExample(): void
    {
        if ($this->checkAdmin()) {
            $em = new ExampleManager();
            $em->deleteExample($_GET['example_id']);
            $this->redirect("index.php?route=allExamples");
        } else {
            $this->render("page/home.html.twig", []);
        }
    }

    //redirection vers le formulaire d'édition d'un exemple
    public function exampleForm(): void
    {
        if ($this->checkAdmin()) {
            $lm = new LanguageManager();
            $cm = new CourseManager();
            $courses = $cm->getAllCourse();
            $languages = $lm->getAllLanguages();
            $this->render("admin/update/update-example.html.twig", ['example_id' => $_GET['example_id'], 'languages' => $languages, "courses" => $courses]);
        } else {
            $this->render("page/home.html.twig", []);
        }
    }

    public function updateExample(): void
    {
        if ($this->checkAdmin()) {
            if (isset($_POST['description']) && isset($_POST['course_id'])) {

                //initalisation des managers
                $em = new ExampleManager();

                //sécurisation des donnés + update de la base de donnée
                $em->updateExample($_POST['example_id'], htmlspecialchars($_POST['description']), htmlspecialchars($_POST['course_id']), $_POST['language']);
                $this->redirect("index.php?route=allExamples");
            }
        } else {
            $this->render("home.html.twig", []);
        }
    }

    //redirection vers le formulaire d'ajout d'un cours
    public function exampleFormAdd(): void
    {
        if ($this->checkAdmin()) {
            $lm = new LanguageManager();
            $cm = new CourseManager();
            $courses = $cm->getAllCourse();
            $languages = $lm->getAllLanguages();
            $this->render("admin/add/add-example.html.twig", ['languages' => $languages, "courses" => $courses]);
        } else {
            $this->render("page/home.html.twig", []);
        }
    }


    public function addExample(): void
    {
        if ($this->checkAdmin()) {
            if (isset($_POST['description']) && isset($_POST['course_id'])) {

                //initalisation des managers
                $em = new ExampleManager();

                //sécurisation des donnés + update de la base de donnée
                $em->addExample(htmlspecialchars($_POST['description']), htmlspecialchars($_POST['course_id']), $_POST['language']);
                $this->redirect("index.php?route=allExamples");
            }
        } else {
            $this->render("page/home.html.twig", []);
        }
    }
}
