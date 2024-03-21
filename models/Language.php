<?php


class Language
{
    private ?int $id = null;
    private string $code;

    public function __construct(private string $name, private string $drapeau)
    {
        $this->name = $name;
        $this->drapeau = $drapeau;
    }

    /**
     * Get the value of id
     */
    public function getId(): int
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
     * Get the value of name
     */
    public function getName(): string
    {
        return $this->name;
    }

    /**
     * Set the value of name
     *
     * @return  self
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get the value of drapeau
     */
    public function getDrapeau(): string
    {
        return $this->drapeau;
    }

    /**
     * Set the value of drapeau
     *
     * @return  self
     */
    public function setDrapeau($drapeau)
    {
        $this->drapeau = $drapeau;

        return $this;
    }

    /**
     * Get the value of code
     */ 
    public function getCode()
    {
        return $this->code;
    }

    /**
     * Set the value of code
     *
     * @return  self
     */ 
    public function setCode($code)
    {
        $this->code = $code;

        return $this;
    }
}
