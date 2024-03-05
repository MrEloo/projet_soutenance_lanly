<?php

abstract class AbstractController
{
    //Initialisation de twig et de son environnement
    private \Twig\Environment $twig;
    public function __construct()
    {
        $loader = new \Twig\Loader\FilesystemLoader('templates');
        $twig = new \Twig\Environment($loader, [
            'debug' => true,
        ]);

        $twig->addExtension(new \Twig\Extension\DebugExtension());
        //Ajout de la session pour qu'elle soit facilement accessible avec twig
        $twig->addGlobal('session', $_SESSION);

        $this->twig = $twig;
    }

    protected function render(string $template, array $data): void
    {
        echo $this->twig->render($template, $data);
        exit();
    }

    //Fonction de redirection
    protected function redirect($route)
    {
        header("Location: $route");
        exit();
    }

    //Fonction qui check si l'utilisateur est bien connecté pour qu'il puisse ou non accéder à une page qui le demande
    protected function isUserOrAdmin(): ?bool
    {
        if (isset($_SESSION['role'])) {
            if ($_SESSION['role'] === 'USER' || $_SESSION['role'] === 'ADMIN') {
                return true;
            }
        } else {
            return null;
        }
    }
}
