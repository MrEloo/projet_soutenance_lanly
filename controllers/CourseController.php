<?php

class CourseController extends AbstractController
{
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
            dump($courses);
            $this->render("course.html.twig", ['courses' => $courses]);
        }
    }
}
