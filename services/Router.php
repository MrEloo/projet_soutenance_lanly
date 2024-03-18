<?php


class Router
{
    private PageController $pc;
    private AuthController $ac;
    private CourseController $cc;
    private ResponseController $rc;
    private AdminController $adc;
    private ExerciceController $ec;
    private ExampleController $exc;
    private UserController $uc;
    private LanguageController $lc;

    public function __construct()
    {
        $this->pc = new PageController();
        $this->ac = new AuthController();
        $this->cc = new CourseController();
        $this->rc = new ResponseController();
        $this->adc = new AdminController();
        $this->ec = new ExerciceController();
        $this->exc = new ExampleController();
        $this->uc = new UserController();
        $this->lc = new LanguageController();
    }

    public function handleRequest(array $get): void
    {
        if (!isset($get["route"])) {
            $this->pc->home();
        } else if (isset($get["route"]) && $get["route"] === 'register') {
            $this->ac->register();
        } else if (isset($get["route"]) && $get["route"] === 'login') {
            $this->ac->login();
        } else if (isset($get["route"]) && $get["route"] === 'check-register') {
            $this->ac->checkRegister();
        } else if (isset($get["route"]) && $get["route"] === 'check-login') {
            $this->ac->checkLogin();
        } else if (isset($get["route"]) && $get["route"] === 'logout') {
            $this->ac->logout();
        } else if (isset($get["route"]) && $get["route"] === 'login_home') {
            $this->pc->loginHome();
        } else if (isset($get["route"]) && $get["route"] === 'checkResponse') {
            $this->rc->checkResponse();
        } else if (isset($get["route"]) && $get["route"] === 'ex_res') {
            $this->rc->showExRes();
        } else if (isset($get["route"]) && $get["route"] === 'administration') {
            $this->adc->showAdminSpace();
        } else if (isset($get["route"]) && $get["route"] === 'allUsers') {
            $this->adc->showUsers();
        } else if (isset($get["route"]) && $get["route"] === 'allCourses') {
            $this->adc->showCourses();
        } else if (isset($get["route"]) && $get["route"] === 'allExercices') {
            $this->adc->showExercices();
        } else if (isset($get["route"]) && $get["route"] === 'allExamples') {
            $this->adc->showExamples();
        } else if (isset($get["route"]) && $get["route"] === 'allLanguages') {
            $this->adc->showLanguages();
        } else if (isset($get["route"]) && $get["route"] === 'create_course') {
            $this->cc->courseFormAdd();
        } else if (isset($get["route"]) && $get["route"] === 'create_exercice') {
            $this->ec->exerciceFormAdd();
        } else if (isset($get["route"]) && $get["route"] === 'create_example') {
            $this->exc->exampleFormAdd();
        } else if (isset($get["route"]) && $get["route"] === 'create_language') {
            $this->lc->languageFormAdd();
        } else if (isset($get["route"]) && $get["route"] === 'add_course') {
            $this->cc->addCourse();
        } else if (isset($get["route"]) && $get["route"] === 'add_exercice') {
            $this->ec->addExercice();
        } else if (isset($get["route"]) && $get["route"] === 'add_example') {
            $this->exc->addExample();
        } else if (isset($get["route"]) && $get["route"] === 'add_language') {
            $this->lc->addLanguage();
        } else if (isset($get["route"]) && $get["route"] === 'update_info_course') {
            $this->cc->updateCourse();
        } else if (isset($get["route"]) && $get["route"] === 'update_info_exercice') {
            $this->ec->updateExercice();
        } else if (isset($get["route"]) && $get["route"] === 'update_info_example') {
            $this->exc->updateExample();
        } else if (isset($get["route"]) && $get["route"] === 'about') {
            $this->pc->aboutPage();
        } else if (isset($get["route"]) && $get["route"] === 'langue') {
            $this->pc->chosenLanguage();
        } else if (isset($get["route"]) && $get["route"] === 'addImage') {
            $this->uc->AddImage();
        } else if (isset($get["route"]) && $get["route"] === 'contact') {
            $this->pc->contactPage();
        } else if (isset($get["route"]) && $get["route"] === 'choice') {
            if (isset($get["cat_id"])) {
                $this->pc->showChoice();
            }
        } else if (isset($get["route"]) && $get["route"] === 'delete_exercice') {
            if (isset($get["ex_id"])) {
                $this->ec->deleteExercice();
            }
        } else if (isset($get["route"]) && $get["route"] === 'delete_example') {
            if (isset($get["example_id"])) {
                $this->exc->deleteExample();
            }
        } else if (isset($get["route"]) && $get["route"] === 'delete_user') {
            if (isset($get["user_id"])) {
                $this->uc->deleteUser();
            }
        } else if (isset($get["route"]) && $get["route"] === 'delete_course') {
            if (isset($get["course_id"])) {
                $this->cc->deleteCourse();
            }
        } else if (isset($get["route"]) && $get["route"] === 'delete_language') {
            if (isset($get["lan_id"])) {
                $this->lc->deleteLanguage();
            }
        } else if (isset($get["route"]) && $get["route"] === 'update_example') {
            if (isset($get["example_id"])) {
                $this->exc->exampleForm();
            }
        } else if (isset($get["route"]) && $get["route"] === 'update_user') {
            if (isset($get["user_id"]) && isset($_GET['role'])) {
                $this->uc->updateUserRole();
            }
        } else if (isset($get["route"]) && $get["route"] === 'update_exercice') {
            if (isset($get["ex_id"])) {
                $this->ec->exerciceForm();
            }
        } else if (isset($get["route"]) && $get["route"] === 'update_course') {
            if (isset($get["course_id"])) {
                $this->cc->courseForm();
            }
        } else if (isset($get["route"]) && $get["route"] === 'course') {
            if (isset($get["cat_id"])) {
                $this->cc->showCourse();
            }
        } else if (isset($get["route"]) && $get["route"] === 'exercices') {
            if (isset($get["cat_id"])) {
                $this->ec->showExercices();
            }
        } else if (isset($get["route"]) && $get["route"] === 'exercice') {
            if (isset($get["course_id"])) {
                $this->ec->showExercice();
            }
        } else if (isset($get["route"]) && $get["route"] === 'change_language') {
            if (isset($get["lan_id"])) {
                $this->lc->changeLanguage();
            }
        } else if (isset($get["route"]) && $get["route"] === 'profil') {
            $this->pc->profil();
        }
    }
}
