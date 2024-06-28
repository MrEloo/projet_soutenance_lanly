<?php

class Correction
{
    private ?int $id = null;
    private string $title;
    private string $description;
    private GlobalCategory $globalCategory;

    public function __construct(string $title, string $description, GlobalCategory $globalCategory)
    {
        $this->title = $title;
        $this->description = $description;
        $this->globalCategory = $globalCategory;
    }

    /**
     * Get the value of id
     */
    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * Set the value of id
     *
     * @return self
     */
    public function setId(?int $id): self
    {
        $this->id = $id;
        return $this;
    }

    /**
     * Get the value of title
     */
    public function getTitle(): string
    {
        return $this->title;
    }

    /**
     * Set the value of title
     *
     * @return self
     */
    public function setTitle(string $title): self
    {
        $this->title = $title;
        return $this;
    }

    /**
     * Get the value of description
     */
    public function getDescription(): string
    {
        return $this->description;
    }

    /**
     * Set the value of description
     *
     * @return self
     */
    public function setDescription(string $description): self
    {
        $this->description = $description;
        return $this;
    }

    /**
     * Get the value of globalCategory
     */
    public function getGlobalCategory(): GlobalCategory
    {
        return $this->globalCategory;
    }

    /**
     * Set the value of globalCategory
     *
     * @return self
     */
    public function setGlobalCategory(GlobalCategory $globalCategory): self
    {
        $this->globalCategory = $globalCategory;
        return $this;
    }
}
