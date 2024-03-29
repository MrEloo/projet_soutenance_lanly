<?php


class Course
{
    private ?int $id = null;
    private ?array $examples = [];
    private ?array $exercices = [];
    private int $locked;
    private bool $finished;
    private int $language_id;

    public function __construct(private string $title, private string $description, private GlobalCategory $globalCategory)
    {
        $this->title = $title;
        $this->description = $description;
        $this->globalCategory = $globalCategory;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function setId(?int $id): self
    {
        $this->id = $id;
        return $this;
    }

    public function getTitle(): string
    {
        return $this->title;
    }

    public function setTitle(string $title): self
    {
        $this->title = $title;
        return $this;
    }

    public function getDescription(): string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;
        return $this;
    }

    public function getExamples(): ?array
    {
        return $this->examples;
    }

    public function setExamples(?array $examples): self
    {
        $this->examples = $examples;
        return $this;
    }

    public function getExercices(): ?array
    {
        return $this->exercices;
    }

    public function setExercices(?array $exercices): self
    {
        $this->exercices = $exercices;
        return $this;
    }

    public function getGlobalCategory(): \GlobalCategory
    {
        return $this->globalCategory;
    }

    public function setGlobalCategory(\GlobalCategory $globalCategory): self
    {
        $this->globalCategory = $globalCategory;
        return $this;
    }

    public function getLocked(): int
    {
        return $this->locked;
    }

    public function setLocked(int $locked): self
    {
        $this->locked = $locked;
        return $this;
    }

    public function getFinished(): bool
    {
        return $this->finished;
    }

    public function setFinished(bool $finished): self
    {
        $this->finished = $finished;
        return $this;
    }

    public function getLanguage_id(): int
    {
        return $this->language_id;
    }

    public function setLanguage_id(int $language_id): self
    {
        $this->language_id = $language_id;
        return $this;
    }
}
