<?php


class UserController extends AbstractController
{

    public function __construct()
    {
        $lang = $_SESSION["user_lang"];

        parent::__construct("auth", $lang);
    }


    //suppression d'un utilisateur en base de données
    public function deleteUser(): void
    {
        if ($this->checkAdmin()) {
            $um = new UserManager();
            $um->deleteUser($_GET['user_id']);
            $this->redirect("index.php?route=allUsers");
        } else {
            $this->render('page/home.html.twig', []);
        }
    }

    //changement du role de l'ulisateur
    public function updateUserRole(): void
    {
        if ($this->checkAdmin()) {
            $um = new UserManager();
            $um->updateUserRole($_GET['role'], $_GET['user_id']);
            $this->redirect("index.php?route=allUsers");
        } else {
            $this->render('page/home.html.twig', []);
        }
    }

    //ajout / update de d'une image en base de donnné de l'utilisateur
    public function addImage(): void
    {


        $uploader = new Uploader();

        if (isset($_FILES)) {
            $uploader->upload($_FILES, 'input_file');
            $um = new UserManager();
            $um->updateUserImage($_SESSION['user_id'], "./uploads/" . $_FILES['input_file']['name']);

            $this->redirect('index.php?route=profil');
        }
    }
}
