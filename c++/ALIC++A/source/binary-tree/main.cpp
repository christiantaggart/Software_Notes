#include <iostream>

#include "BinaryTree.h"

int main() {
    std::cout << "Looking at root of binary tree" << std::endl;

    BinaryTree *bt = new BinaryTree();
    BinaryTreeNode *d = new BinaryTreeNode('D', nullptr, nullptr);
    BinaryTreeNode *e = new BinaryTreeNode('E', nullptr, nullptr);
    BinaryTreeNode *b = new BinaryTreeNode('B', d, e);
    BinaryTreeNode *c = new BinaryTreeNode('C', nullptr, nullptr);
    bt->root = new BinaryTreeNode('A', b, c);

//    bt->traversePreOrder(bt->root);
//    bt->traverseInOrder(bt->root);
    bt->traversePostOrder(bt->root);

    delete d;
    delete e;
    delete b;
    delete c;
    delete bt;

    return 0;
}