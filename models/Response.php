<?php

class Response
{
    private ?int $id = null;

    public function __construct(private string $content, private User $user, private Course $course)
    {
        $this->content = $content;
        $this->user = $user;
        $this->course = $course;
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
     * Get the value of content
     */
    public function getContent()
    {
        return $this->content;
    }

    /**
     * Set the value of content
     *
     * @return  self
     */
    public function setContent($content)
    {
        $this->content = $content;

        return $this;
    }

    /**
     * Get the value of user
     */
    public function getUser()
    {
        return $this->user;
    }

    /**
     * Set the value of user
     *
     * @return  self
     */
    public function setUser($user)
    {
        $this->user = $user;

        return $this;
    }

    /**
     * Get the value of course
     */
    public function getCourse()
    {
        return $this->course;
    }

    /**
     * Set the value of course
     *
     * @return  self
     */
    public function setCourse($course)
    {
        $this->course = $course;

        return $this;
    }
}
