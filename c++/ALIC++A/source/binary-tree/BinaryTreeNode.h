//
// Created by Alica Key on 2/13/17.
//

#ifndef BINARY_TREE_BINARYTREENODE_H
#define BINARY_TREE_BINARYTREENODE_H


class BinaryTreeNode {
public:
    BinaryTreeNode(char initialValue, BinaryTreeNode *left, BinaryTreeNode *right);

    int value;
    BinaryTreeNode *left;
    BinaryTreeNode *right;
};


#endif //BINARY_TREE_BINARYTREENODE_H
