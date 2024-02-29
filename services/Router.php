<?php


class Router
{
    private PageController $pc;
    private AuthController $ac;
    private CourseController $cc;

    public function __construct()
    {
        $this->pc = new PageController();
        $this->ac = new AuthController();
        $this->cc = new CourseController();
    }

    public function handleRequest(array $get): void
    {
        if (!isset($get["route"]) || $get["route"] === 'home') {
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
        } else if (isset($get["route"]) && $get["route"] === 'choice') {
            if (isset($get["cat_id"])) {
                $this->cc->showChoice();
            }
        } else if (isset($get["route"]) && $get["route"] === 'course') {
            if (isset($get["cat_id"])) {
                $this->cc->showCourse();
            }
        } else if (isset($get["route"]) && $get["route"] === 'profil') {
            $this->pc->profil();
        }
    }
}
