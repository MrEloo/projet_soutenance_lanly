<?php

class AdminController extends AbstractController
{

    public function __construct()
    {
        $lang = $_SESSION["user_lang"];

        parent::__construct("admin", $lang);
    }
    //Redirection vers l'espace administration
    public function showAdminSpace(): void
    {
        if ($this->checkAdmin()) {
            $this->render('admin/espace-admin.html.twig', []);
        } else {
            $this->render('page/home.html.twig', []);
        }
    }

    //Affiche la liste de tous les utilisateurs
    public function showUsers(): void
    {
        if ($this->checkAdmin()) {
            $um = new UserManager();
            $users = $um->getAllUsers();
            $this->render('admin/show-users.html.twig', ['users' => $users]);
        } else {
            $this->render('page/home.html.twig', []);
        }
    }

    //Affiche la liste de tous les cours
    public function showCourses(): void
    {
        if ($this->checkAdmin()) {
            $cm = new CourseManager();
            $courses = $cm->getAllCourseWithoutLanguageId();
            $this->render('admin/show-courses.html.twig', ['courses' => $courses]);
        } else {
            $this->render('page/home.html.twig', []);
        }
    }

    //Affiche la liste de tous les exos
    public function showExercices(): void
    {
        if ($this->checkAdmin()) {
            $em = new ExerciceManager();
            $exercices = $em->getAllExercices();
            $this->render('admin/show-exercices.html.twig', ['exercices' => $exercices]);
        } else {
            $this->render('page/home.html.twig', []);
        }
    }

    //Affiche la liste de tous les exemples de cours
    public function showExamples(): void
    {
        if ($this->checkAdmin()) {
            $em = new ExampleManager();
            $examples = $em->getAllExamples($_SESSION['user_language']);
            $this->render('admin/show-examples.html.twig', ['examples' => $examples]);
        } else {
            $this->render('page/home.html.twig', []);
        }
    }

    //Affiche la liste de tous les langues proposés
    public function showLanguages(): void
    {
        if ($this->checkAdmin()) {
            $lm = new LanguageManager();
            $languages = $lm->getAllLanguages();
            $this->render('admin/show-languages.html.twig', ['languages' => $languages]);
        } else {
            $this->render('page/home.html.twig', []);
        }
    }
}
