<?php

class CourseController extends AbstractController
{
    //affiche la liste des catégories d'exercices disponible
    public function showChoice(): void
    {
        if ($this->isUserOrAdmin()) {
            $gcm = new GlobalCategoryManager();
            $category = $gcm->getOneCatById($_GET['cat_id']);
            $this->render("choice.html.twig", ['category' => $category]);
        } else {
            $this->render("home.html.twig", []);
        }
    }

    //Affiche la liste des cours associés à sa catégorie
    public function showCourse(): void
    {
        if ($this->isUserOrAdmin()) {
            $cm = new CourseManager();
            $courses = $cm->getCoursesByTheirCat($_GET['cat_id']);
            $em = new ExampleManager();
            $examples_array = [];
            foreach ($courses as $course) {
                $examples_array = $em->getExamplesFromCourse($course->getId());
                $course->setExamples($examples_array);
            }
            $this->render("course.html.twig", ['courses' => $courses]);
        }
    }

    //Affiche tous les exercices d'une catégorie selon l'utilisateur afin d'afficher les progressions de chacuns
    public function showExercices(): void
    {
        if ($this->isUserOrAdmin()) {
            $em = new ExerciceManager();
            $cm = new CourseManager();


            $courses = $cm->getAllCourse();
            foreach ($courses as $course) {

                $userFinishedCourses = $cm->getCourseByUser($_SESSION['user_id'], $course->getId());
                if (!$userFinishedCourses) {
                    $cm->addCourseInUsersCourses($_SESSION['user_id'], $course->getId());
                }
            }


            $userCourses = $cm->getAllCourseFromUser($_SESSION['user_id']);

            foreach ($userCourses as $key => $userCourse) {
                $exercices = $em->getAllExercicesByCourse($userCourse->getId());
                $userCourse->setExercices($exercices);
            }
            dump($userCourses);


            $this->render("exercices.html.twig", ['courses' => $userCourses]);
        } else {
            $this->render("home.html.twig", []);
        }
    }

    //Affiche la liste de tous les exercices d'un cours
    public function showExercice(): void
    {
        if ($this->isUserOrAdmin()) {
            $em = new ExerciceManager();
            $exercice = $em->getAllExercicesByCourse($_GET['course_id']);
            $this->render("exercice.html.twig", ['exercice' => $exercice]);
        } else {
            $this->render("home.html.twig", []);
        }
    }
}
