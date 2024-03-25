<?php

class Uploader
{
    private array $extensions = ["jpeg", "jpg", "png", "pdf"];

    public function upload(array $files, string $inputName): void
    {
        $tempImagePath = $files[$inputName]['tmp_name'];

        $name = $files[$inputName]['name'];

        $size = $files[$inputName]['size'];

        $tabFileName = explode('.', $name);

        $file_ext = strtolower(end($tabFileName));


        if (in_array($file_ext, $this->extensions) === false && $size < 30000) {
            throw new Exception("Bad file extension or size. Please upload a JPG, PDF or PNG file.");
            $_SESSION['picture_size'] = "L'image que vous tentez d'enregistrer est trop lourde. Veuillez en choisir une autre";
        } else {
            move_uploaded_file($tempImagePath, "./uploads/$name");
        }
    }
}
