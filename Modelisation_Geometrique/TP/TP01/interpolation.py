
import math
import numpy as np
from typing import List, Tuple

#####################################################
############## Neville's algorithm ##################
#####################################################


def neville(XX: np.ndarray, YY:np.ndarray, x: float) -> float:
    """
    Perform polynomial interpolation using Neville's algorithm.

    Args:
        XX (np.ndarray): The x-coordinates of the data points.
        YY (np.ndarray): The y-coordinates of the data points.
        x (float): The value at which the interpolation is calculated.

    Returns:
        float: The interpolated value at x.
    """

    Y = np.array(YY)
    n = len(XX)
    for j in range(1,n):
        for i in range(0,n-j):
            Y[i] = ((XX[i+j] - x) * Y[i] + (x - XX[i]) * Y[i+1]) / (XX[i+j] - XX[i])
    return Y[0]
    

#####################################################
################ Time sampling ######################
#####################################################



def tchebycheff_parametrisation(nb_point: int) -> List[float]:
    """
    Compute the Tchebycheff abscissas for a given number of points (from -1 to 1).

    Args:
        nb_point (int): The number of points for which the Tchebycheff abscissas must be computed.

    Returns:
        List[float]: A list containing the Tchebycheff abscissas.
    """
    return [math.cos(((2*k-1)*math.pi) / (2*nb_point)) for k in range(1,nb_point+1)]



def regular_parametrisation(nb_point: int) -> List[float]:
    """
    Create regular subdivision with the first point at 0 and the last at 1.

    Args:
        nb_point (int): The number of points for which regular abscissas are calculated.

    Returns:
        List[float]: A list containing the regular abscissas.
    """
    
    pas = 1/(nb_point - 1)
    return [0] + [pas*k + pas for k in range(nb_point - 1)]



def distance_parametrisation(XX: List[float], YY: List[float]) -> List[float]:
    """
    Create subdivision where spacing between points is proportional to their distance in R2,
    with the first point at 0 and the last at 1.

    Args:
        XX (List[float]): The X coordinates of the points.
        YY (List[float]): The Y coordinates of the points.

    Returns:
        List[float]: A list containing the abscissas proportional to the distances.
    """

    distances = [np.sqrt((XX[i] - XX[i+1])**2 + (YY[i] - YY[i+1])**2) for i in range(len(XX)-1)]

    subdiv = [0]
    for i in range(len(distances)):
        subdiv.append(subdiv[-1] + distances[i])

    min = np.min(subdiv)
    max = np.max(subdiv)
    subdiv_normalized = [(subdiv[i] - min) / (max - min) for i in range(len(subdiv))]

    return subdiv_normalized



def parametrisation_racinedistance(XX: List[float], YY: List[float]) -> List[float]:
    """
    Create subdivision where spacing between points is proportional to the square root of their distance in R2,
    with the first point at 0 and the last at 1.

    Args:
        XX (List[float]): The X coordinates of the points.
        YY (List[float]): The Y coordinates of the points.

    Returns:
        List[float]: A list containing the abscissas proportional to the square roots of the distances.
    """

    distances = [np.sqrt(np.sqrt((XX[i] - XX[i+1])**2 + (YY[i] - YY[i+1])**2)) for i in range(len(XX)-1)]

    subdiv = [0]
    for i in range(len(distances)):
        subdiv.append(subdiv[-1] + distances[i])

    min = np.min(subdiv)
    max = np.max(subdiv)
    subdiv_normalized = [(subdiv[i] - min) / (max - min) for i in range(len(subdiv))]

    return subdiv_normalized




#####################################################
############ Neville's Algorithm @@@@ ###############
#####################################################

def neville_param(XX, YY, TT, list_tt) -> Tuple[List[float], List[float]]:
    """
    Interpolate points using Neville's algorithm for given x and y coordinates.

    Args:
        XX (list[float]): The x-coordinates of the data points.
        YY (list[float]): The y-coordinates of the data points.
        TT (list[float]): The time points corresponding to the data points.
        list_tt (list[float]): The time points at which to evaluate the interpolation.

    Returns:
        tuple: Two lists containing the interpolated x and y coordinates.
    """

    return [neville(TT, XX, x) for x in list_tt], [neville(TT, YY, x) for x in list_tt]


def surface_interpolation_neville(X, Y, Z, TT_x,TT_y, list_tt, nb_points_x) -> np.ndarray:
    """
    Interpolates a surface at given time points using Neville's interpolation method.

    Args:
        X (np.ndarray): X coordinates of 3D points (shape: (nb_points_x, len(TT_y))).
        Y (np.ndarray): Y coordinates of 3D points (shape: (nb_points_x, len(TT_y))).
        Z (np.ndarray): Z coordinates of 3D points (shape: (nb_points_x, len(TT_y))).
        TT_x (List[float]): Times corresponding to the points in X.
        TT_y (List[float]): Times corresponding to the points in Y.
        list_tt (List[float]): Times at which to evaluate the interpolated surface.
        nb_points_x (int): Number of points in the grid for interpolation.

    Returns:
        np.ndarray: Interpolated surface (shape: (len(list_tt), len(list_tt), 3)).
    """
    
    n = len(list_tt)
    interpolated_surface_1 = np.zeros((nb_points_x, n, 3))  # Intermediate surface
    interpolated_surface = np.zeros((n, n, 3))  # Final interpolated surface

    ##############################
    ## FAUX, REFAIRE ICI
    ##############################
    # interpolation according to X    
    for i in range(nb_points_x):
        for j in range(n):
            for x in list_tt:
                # interpolation for X
                interpolated_surface_1[i,j,0] = neville(TT_x, X[i,:], x)
                # interpolation for Y
                interpolated_surface_1[i,j,1] = neville(TT_x, Y[i,:], x)
                # interpolation for Z
                interpolated_surface_1[i,j,2] = neville(TT_x, Z[i,:], x)

    # interpolation according to Y  
    for i in range(n):
        for j in range(n):
            for x in list_tt:
                # interpolation for X
                interpolated_surface[i,j,0] = neville(TT_y, interpolated_surface_1[:,i,0], x)
                # interpolation for Y
                interpolated_surface[i,j,1] = neville(TT_y, interpolated_surface_1[:,i,1], x)
                # interpolation for Z
                interpolated_surface[i,j,2] = neville(TT_y, interpolated_surface_1[:,i,2], x)



    return interpolated_surface