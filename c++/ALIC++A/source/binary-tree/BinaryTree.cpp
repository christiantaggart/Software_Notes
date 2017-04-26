//
// Created by Alica Key on 2/13/17.
//

#include "BinaryTree.h"

#include <iostream>

BinaryTree::BinaryTree() {
    this->root = new BinaryTreeNode(0, nullptr, nullptr);
}

BinaryTree::~BinaryTree() {
    delete this->root;
}

void BinaryTree::traversePreOrder(BinaryTreeNode *subtreeRoot) {
    printf("%c ", subtreeRoot->value);

    if (subtreeRoot->left != nullptr) {
        this->traversePreOrder(subtreeRoot->left);
    }

    if (subtreeRoot->right != nullptr) {
        this->traversePreOrder(subtreeRoot->right);
    }
}

void BinaryTree::traverseInOrder(BinaryTreeNode *subtreeRoot) {
    if (subtreeRoot->left != nullptr) {
        this->traverseInOrder(subtreeRoot->left);
    }

    printf("%c ", subtreeRoot->value);

    if (subtreeRoot->right != nullptr) {
        this->traverseInOrder(subtreeRoot->right);
    }
}

void BinaryTree::traversePostOrder(BinaryTreeNode *subtreeRoot) {
    if (subtreeRoot->left != nullptr) {
        this->traversePostOrder(subtreeRoot->left);
    }

    if (subtreeRoot->right != nullptr) {
        this->traversePostOrder(subtreeRoot->right);
    }

    printf("%c ", subtreeRoot->value);
}