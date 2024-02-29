<?php


class GlobalCategoryManager extends AbstractManager
{
    public function getAllGlobalCategory(): array
    {
        $selectAllGlobalCategoryQuery = $this->db->prepare('SELECT * FROM global_category ');
        $selectAllGlobalCategoryQuery->execute();
        $global_categories_data = $selectAllGlobalCategoryQuery->fetchAll(PDO::FETCH_ASSOC);

        $global_categories_array = [];

        foreach ($global_categories_data as $global_category_data) {
            $global_category = new GlobalCategory($global_category_data['name']);
            $global_category->setId($global_category_data['id']);
            $global_categories_array[] = $global_category;
        }

        return $global_categories_array;
    }

    public function getOneCatById(int $id): GlobalCategory
    {
        $selectOneCatById = $this->db->prepare('SELECT * FROM global_category WHERE id = :id');
        $parameters = ['id' => $id];
        $selectOneCatById->execute($parameters);
        $category_data = $selectOneCatById->fetch(PDO::FETCH_ASSOC);

        $global_category = new GlobalCategory($category_data['name']);
        $global_category->setId($category_data['id']);
        return $global_category;
    }
}
