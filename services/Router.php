<?php


class Router
{
    private PageController $pc;
    private AuthController $ac;
    private CourseController $cc;
    private ResponseController $rc;

    public function __construct()
    {
        $this->pc = new PageController();
        $this->ac = new AuthController();
        $this->cc = new CourseController();
        $this->rc = new ResponseController();
    }

    public function handleRequest(array $get): void
    {
        if (!isset($get["route"])) {
            $this->pc->home();
        } else if (isset($get["route"]) && $get["route"] === 'register') {
            $this->ac->register();
        } else if (isset($get["route"]) && $get["route"] === 'check-register') {
            $this->ac->checkRegister();
        } else if (isset($get["route"]) && $get["route"] === 'login') {
            $this->ac->login();
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
        } else if (isset($get["route"]) && $get["route"] === 'choice') {
            if (isset($get["cat_id"])) {
                $this->cc->showChoice();
            }
        } else if (isset($get["route"]) && $get["route"] === 'course') {
            if (isset($get["cat_id"])) {
                $this->cc->showCourse();
            }
        } else if (isset($get["route"]) && $get["route"] === 'exercices') {
            if (isset($get["cat_id"])) {
                $this->cc->showExercices();
            }
        } else if (isset($get["route"]) && $get["route"] === 'exercice') {
            if (isset($get["course_id"])) {
                $this->cc->showExercice();
            }
        } else if (isset($get["route"]) && $get["route"] === 'profil') {
            $this->pc->profil();
        }
    }
}
