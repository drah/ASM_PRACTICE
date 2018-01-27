#include <stdio.h>
#include <stdlib.h>


int main(){
	extern void strc(char*,char*,int);
	char s1[100];
	char s2[100];
	int i;
	printf("%s%s","(TA will input a string randomly to test your program)\n",
		   "please input the two strings:\n");
	printf("string1:");
	scanf("%s",&s1);
	
	printf("string2:");
	scanf("%s",&s2);

	i=0;
	while(s2[i])i++;
	s2[i]='\0';

	i=0;
	while(s1[i])i++;
	s1[i]='\0';

	printf("call procedure to copy string1 to string2\nresult\nstring1=");
	strc(s1,s2,i+1);
	printf("%s%s%s%c",s1,"\nstring2=",s2,'\n');
	system("pause");
	return 0;
}