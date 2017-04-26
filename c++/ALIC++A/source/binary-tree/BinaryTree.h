//
// Created by Alica Key on 2/13/17.
//

#ifndef BINARY_TREE_BINARYTREE_H
#define BINARY_TREE_BINARYTREE_H


#include "BinaryTreeNode.h"

class BinaryTree {
public:
    BinaryTree();
    ~BinaryTree();

    void traversePreOrder(BinaryTreeNode *subtreeRoot);
    void traverseInOrder(BinaryTreeNode *subtreeRoot);
    void traversePostOrder(BinaryTreeNode *subtreeRoot);

    BinaryTreeNode *root;
};


#endif //BINARY_TREE_BINARYTREE_H
