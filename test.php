<?php

if (isset($_GET['route']) && $_GET['route'] === 'categories') {
    echo json_encode(['data' => 'voici la liste des catégories']);
} else {
    echo json_encode(['error' => 'cette route n\'existe pas']);
}
