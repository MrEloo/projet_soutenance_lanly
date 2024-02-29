<?php

class PageController extends AbstractController
{
    public function home(): void
    {
        $languageManager = new LanguageManager();
        $languages = $languageManager->getAllLanguages();
        $this->render("home.html.twig", []);
    }

    public function loginHome(): void
    {
        if ($this->isUserOrAdmin()) {
            $gcm = new GlobalCategoryManager();
            $global_categories = $gcm->getAllGlobalCategory();
            dump($global_categories);
            $this->render("login_home.html.twig", ['categories' => $global_categories]);
        } else {
            $this->render("home.html.twig", []);
        }
    }

    public function profil(): void
    {
        if ($this->isUserOrAdmin()) {
            $um = new UserManager();
            $user = $um->getUserByEmail($_SESSION['user_email']);
            $this->render("profil.html.twig", ['user' => $user]);
        } else {
            $this->render("home.html.twig", []);
        }
    }
}
