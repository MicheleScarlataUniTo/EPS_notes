#27
# Sia X una variabile aleatoria distribuita come una Normale di media 0
# e varianza 4

#La probabilità che X sia minore di 1.5. 
pnorm(1.5, 0, 2)

# La probabilità che X sia maggiore di 3.
1 - pnorm(3, 0, 2)

# La probabilità che X sia maggiore di 3 sapendo che X è minore di 6
(pnorm(6, 0, 2) - pnorm(3, 0, 2)) / (pnorm(6, 0, 2))


#28

# Sia X una variabile aleatoria distribuita come una Normale di media 2
# e varianza 4
# Sia Y una variabile aleatoria distribuita come una Normale standard, 
# indipendente da X.
# Determinare:
    
# La probabilità che X sia maggiore di 3. 
1 - pnorm (3, 2, 2)

# La probabilità che entrambe le variabili aleatorie siano maggiori di 3. 
(1 - pnorm (3, 2, 2)) * (1 - pnorm(3, 0, 1))

# La probabilità che X sia minore di 7 sapendo che X è maggiore di 6. 
(pnorm(7, 2, 2) - pnorm(6, 2, 2)) / (1 - pnorm(6, 2, 2))




#29
# Sia X una variabile aleatoria distribuita come una Normale di media 0
# e varianza 4

#La probabilità che X sia minore di 1.5. 
pnorm(1.5, 0, 2)

#La probabilità che X sia maggiore di 3. 
1 - pnorm(3, 0, 2)

#La probabilità che X sia compresa fra -2 e 1. 
pnorm(1, 0, 2) - pnorm(-2, 0, 2)

#La probabilità che X sia maggiore di 3 sapendo che X è minore di 6. 
(pnorm(6, 0, 2) - pnorm(3, 0, 2)) / (pnorm(6, 0, 2))



#31
# Let X be a Normal random variable of mean 10
# and variance 16

# The probability that X is larger than 13. 
1 - pnorm(13, 10, 4)


# The probability that X is between 8.5 and 12. 
pnorm(12, 10, 4) - pnorm(8.5, 10, 4)


# The probability that X is smaller than 8.5 or larger than 12 given that X 
# is larger than 8. 
(1 - (pnorm(12, 10, 4) - pnorm(8.5, 10, 4)) - pnorm(8, 10, 4)) / (1 - pnorm(8, 10, 4))


# The probability that X is smaller than 7 given that X is larger than 6
(pnorm(7, 10, 4) - pnorm(6, 10, 4)) / (1 - pnorm(6, 10, 4))




# 33

#Sia X una variabile aleatoria distribuita come una Normale di media 2
#e varianza 4
#Sia Y una variabile aleatoria distribuita come una Normale standard, 
#indipendente da X.
#Determinare:
    
# La probabilità che X sia maggiore di 3. 
1 - pnorm(3, 2, 2)


# La probabilità che entrambe le variabili aleatorie siano maggiori di 3. 
(1 - pnorm(3, 2, 2)) * (1 - pnorm(3, 0, 1))


# La probabilità che X sia compresa fra 1.5 e 2 sapendo che Y è maggiore di 7. 
pnorm(2, 2, 2) - pnorm(1.5, 2, 2)


# La probabilità che X sia minore di 7 sapendo che X è maggiore di 6.
(pnorm(7, 2, 2) - pnorm(6, 2, 2)) / (1 - pnorm(6, 2, 2))




#34
# Let X be a Normal random variable of mean 2
# and variance 4
# Let Y be a standard Normal random variable, independent of X. Calculate:
    
# The probability that both variable are larger than 3. 
(1 - pnorm(3, 2, 2)) * (1 - pnorm(3, 0, 1))


# The probability that X is between 1.5 and 2, knowing that Y is larger than 7. 
pnorm(2, 2, 2) - pnorm(1.5, 2, 2) 


# The probability that X is smaller than 2.5 or that Y is larger than 2. 
pnorm(2.5, 2, 2) + (1 - pnorm(2, 0, 1)) - pnorm(2.5, 2, 2)*(1 - pnorm(2, 0, 1))


# The probability that X is smaller than 7 given that X is larger than 6.
(pnorm(7, 2, 2) - pnorm(6, 2, 2)) / (1 - pnorm(6, 2, 2))





#35

(1 - pnorm(3, 3, 1)) * (1 - pnorm(0, 0, 1))
# corrisponde logicamente a 0.5 * 0.5

pnorm(0, 3, 1) - pnorm(-1, 3, 1)

# La probabilità che X sia minore di 2.5 oppure che Y sia maggiore di -1, 
# sapendo che Y è maggiore di -2. 
pnorm(2.5, 3, 1) + ((1 - pnorm(-1, 0, 1)) / (1 - pnorm(-2, 0, 1))) - 
    (pnorm(2.5, 3, 1))*((1 - pnorm(-1, 0, 1)) / (1 - pnorm(-2, 0, 1)))


# La probabilità che X sia minore di 7 sapendo che (X+1) è maggiore di 6
## x+1 > 6
## x > 5

## chiede p(5 < x < 7)
(pnorm(7, 3, 1) - pnorm(5, 3, 1)) / (1 - pnorm(5, 3, 1))















