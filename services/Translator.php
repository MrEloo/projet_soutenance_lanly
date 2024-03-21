<?php

class Translator
{

    public function __construct(private string $file, private string $lang, private array $translations = [])
    {
        //initialisation de la méthode 
        $this->loadTranslations();
    }

    private function loadTranslations(): void
    {
        //Recherche du chemin ou se trouve les traductions
        $filePath = "./translations/{$this->file}_{$this->lang}.json";
        //Décoade du Json
        $this->translations = json_decode(file_get_contents($filePath), true);
    }

    public function translate(string $key)
    {
        //si la clé est trouvé, on l'a retoune
        if (isset($this->translations[$key])) {
            return $this->translations[$key];
        } else {
            return $key;
        }
    }
}
