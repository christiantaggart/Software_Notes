# Instructions:
# Fill in the following function stubs to achieve the following:

# Accept two events and their sample space(in that order).

# Return "Improper Specification" if any of the arguments are not sets, or if the two events are not subsets of the sample space.

# If the arguments pass the above criteria, calculate and print the outcome of each of DeMorgan's laws for these sets. You may use either side of the equation to make the calculation. Return these two sets as a tuple in the order(Law A, Law B):

# Law A(E1∪E2)C = EC1∩EC2
# Law B(E1∩E2)C = EC1∪EC2


def deMorgans(E, F, S):
    '''
    Return, as a tuple of the form (Law A, Law B), each of the sets
    associated with De Morgan's laws as applied to sets E and F.

    Return "Improper Specification" if three sets are not supplied
    or if the events E and F are not subsets of the sample space S.
    
    Parameters
    ----------
    E : {set} First event space
    F : {set} Second event space
    S : {set} Complete sample space

    Returns
    -------
    tuple({set}, {set}) or {str} 

    Example:
    >>> DeMorgans(set([1,2,3]), set([2,3,4]), set([0,1,2,3,4,5]))
    (set([0, 5]), set([0, 1, 2, 4, 5])
    '''

    if check_specs(E, F, S) == "fail":
        return "Improper Specification"
    else:
        law_a = lawA(E, F, S)
        law_b = lawB(E, F, S)
    return (law_a, law_b)


def check_specs(E, F, S):
    if (((type(E) and type(F) and type(S)) is set) and (E < S and F < S)):
        # print('passed check_specs 1') # delete
        return 'pass'
        # if (E < S and F < S): # check if subsets of sample space S
        #     print('passed check_specs') # delete
        #     return 'pass'
        # else:
        #     print('failed check_specs due to subset') # delete
        #     return 'fail'
    else:
        # print('failed check_specs due to type or !SubSet')  # delete
        return 'fail'

def lawA(E, F, S): # E Union F complement S
    # print('E union F complement S: ',  S - (E| F))
    return S - (E | F)


def lawB(E, F, S): # E Intersection F compliment S
    # print ('E intersection F compliment S: ',  S - (E & F))
    return S - (E & F)






deMorgans(set([1, 2, 3]), set([2, 3, 4]), set([0, 1, 2, 3, 4, 5])) # good args
# deMorgans(set([1, 2, 3]), set([2, 3, 4]), 'hello') # args not all sets
# deMorgans(set([1, 2, 3]), set([2, 8, 4]), set([0, 1, 2, 3, 4, 5])) # not subset of sample



