<?php


class Correction
{

    private ?int $id = null;

    public function __construct(private string $title, private string $description, private GlobalCategory $globalCategory)
    {
        $this->title = $title;
        $this->description = $description;
        $this->globalCategory = $globalCategory;
    }

    /**
     * Get the value of id
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set the value of id
     *
     * @return  self
     */
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Get the value of title
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * Set the value of title
     *
     * @return  self
     */
    public function setTitle($title)
    {
        $this->title = $title;

        return $this;
    }

    /**
     * Get the value of description
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set the value of description
     *
     * @return  self
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get the value of globalCategory
     */
    public function getGlobalCategory()
    {
        return $this->globalCategory;
    }

    /**
     * Set the value of globalCategory
     *
     * @return  self
     */
    public function setGlobalCategory($globalCategory)
    {
        $this->globalCategory = $globalCategory;

        return $this;
    }
}
