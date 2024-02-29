<?php

abstract class AbstractController
{
    private \Twig\Environment $twig;
    public function __construct()
    {
        $loader = new \Twig\Loader\FilesystemLoader('templates');
        $twig = new \Twig\Environment($loader, [
            'debug' => true,
        ]);

        $twig->addExtension(new \Twig\Extension\DebugExtension());
        $twig->addGlobal('session', $_SESSION);

        $this->twig = $twig;
    }

    protected function render(string $template, array $data): void
    {
        echo $this->twig->render($template, $data);
    }

    protected function redirect($route)
    {
        header("Location: $route");
        exit();
    }

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
