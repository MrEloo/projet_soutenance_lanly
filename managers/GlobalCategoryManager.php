<?php


class GlobalCategoryManager extends AbstractManager
{

    public function verifyLanguage()
    {
        $allowed_languages = ['en', 'fr', 'es', 'ru', 'it', 'de'];
        $user_lang = $_SESSION['user_lang'];

        if (!in_array($user_lang, $allowed_languages, true)) {
            throw new InvalidArgumentException('Langue non autorisée');
        } else {
            return "global_category_{$user_lang}";
        }
    }

    public function getAllGlobalCategory(): ?array
    {

        $table = $this->verifyLanguage();
        
        $selectAllGlobalCategoryQuery = $this->db->prepare("SELECT * FROM $table ");
        $selectAllGlobalCategoryQuery->execute();
        $global_categories_data = $selectAllGlobalCategoryQuery->fetchAll(PDO::FETCH_ASSOC);

        if ($global_categories_data) {

            $global_categories_array = [];

            foreach ($global_categories_data as $global_category_data) {
                $global_category = new GlobalCategory($global_category_data['name']);
                $global_category->setId($global_category_data['id']);
                $global_categories_array[] = $global_category;
            }

            return $global_categories_array;
        } else {
            return null;
        }
    }

    public function getOneCatById(int $id): ?GlobalCategory
    {

        $table = $this->verifyLanguage();

        $selectOneCatById = $this->db->prepare("SELECT * FROM $table WHERE id = :id");
        $parameters = ['id' => $id];
        $selectOneCatById->execute($parameters);
        $category_data = $selectOneCatById->fetch(PDO::FETCH_ASSOC);

        if ($category_data) {
            $global_category = new GlobalCategory($category_data['name']);
            $global_category->setId($category_data['id']);
            return $global_category;
        } else {
            return null;
        }
    }
}
