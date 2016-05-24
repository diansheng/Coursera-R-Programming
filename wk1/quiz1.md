Since someone has published a pretty neat answer at [https://github.com/cynthia0611/Coursera-R-Programming/blob/master/Week-1/Quiz%201.md](https://github.com/cynthia0611/Coursera-R-Programming/blob/master/Week-1/Quiz%201.md), I would not repeat that. However, there are still some alternative solutions i think worth taking down.

####Alternative solutions  

**Question 17**
What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.

**Answer**
`42.1`

**Solution 1**
```
# provided originally by cynthia0611
> datanotna<-subset(data,!is.na(Ozone))
> apply(datanotna,2,mean)
    Ozone   Solar.R      Wind      Temp     Month       Day 
42.129310        NA  9.862069 77.870690  7.198276 15.534483
```

There are a few alternatives. `colMeans` can be used instead of `apple(,2,mean)`. `na.rm=TRUE` can replace `subset`. Besides `summary` is quite an option.

**Solution 2**
```
> colMeans(data, na.rm = TRUE)['Ozone']
    Ozone
42.129310
```
**Solution 3**
```
> colMeans(data, na.rm = TRUE)[1]
    Ozone
42.129310
```
**Solution 4**
```
> colMeans(data, na.rm = TRUE)
    Ozone   Solar.R      Wind      Temp     Month       Day 
42.129310        NA  9.862069 77.870690  7.198276 15.534483
```
**Solution 5**
```
> summary(data, na.rm=True)
     Ozone           Solar.R           Wind             Temp           Month            Day      
 Min.   :  1.00   Min.   :  7.0   Min.   : 1.700   Min.   :56.00   Min.   :5.000   Min.   : 1.0  
 1st Qu.: 18.00   1st Qu.:115.8   1st Qu.: 7.400   1st Qu.:72.00   1st Qu.:6.000   1st Qu.: 8.0  
 Median : 31.50   Median :205.0   Median : 9.700   Median :79.00   Median :7.000   Median :16.0  
 Mean   : 42.13   Mean   :185.9   Mean   : 9.958   Mean   :77.88   Mean   :6.993   Mean   :15.8  
 3rd Qu.: 63.25   3rd Qu.:258.8   3rd Qu.:11.500   3rd Qu.:85.00   3rd Qu.:8.000   3rd Qu.:23.0  
 Max.   :168.00   Max.   :334.0   Max.   :20.700   Max.   :97.00   Max.   :9.000   Max.   :31.0  
 NA's   :37       NA's   :7                                           
```



