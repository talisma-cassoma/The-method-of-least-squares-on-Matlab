clear all
%voici mon ensemble des mesures {(x1,y1),(x2,y2).......(xn,yn)} il s'agit
%des notes des  certains eleves ont obtenu en fonction du temps
%qu'ils ont consacré pour la revision. 
x=[0, 1, 2, 3, 4, 5, 6, 6, 7, 8, 10];
y=[23, 41, 56, 47, 64, 59, 77, 82, 92, 82, 88];
figure(1)
plot(x,y,'b');
hold on
plot(x,y,'*b');
%normalization de la fontion
M = max(y);
y=y/M;
%d'apres la figure 1 on touvre 6 extremes alors notre degré du polynome N est superiuer ou égal a 6 
N=6;
% calcul de la matrice A pour (i,j)------------------
for i=1:N+1;
    for j=1:N+1;
         v=x.^(i+j-2);
         A(i,j)=sum(v);
     end
end
for i=1:N+1;
       
         v=(x.^(i-1)).*y;
          s(i)=sum(v);
      
end
% on transforme le vecteur ligne y en vecteur colone:
s=s'; 
% inv(A) donc la solution est: 
alpha= inv(A)*s;
% on calcule les valeurs du model dans ym:
ym=alpha(1);
for i=2:N+1
    ym=ym+alpha(i)*x.^(i-1);
end
ym=ym/max(ym);
figure(2)
plot(x,y,'*b');
% pour que le matlab laisse ce qui a afixé avant
hold on
% superposer le model polynomial
plot(x,ym,'k');
%---------------------------------------------------------------
%---on voit tresbien que notre fonction Ym(x) ne s'approche  pas tres bien de la y(x)
%---alors on augmente N jusqu'a a ce quon trouve la meuiller approximation...apres 
%---quelques essais on touvre que le polynomme de degré N=9 c'est celui qui
%sapproche le mieux
Nb=9;
for i=1:Nb+1;
    for j=1:Nb+1;
         vb=x.^(i+j-2);
         Ab(i,j)=sum(vb);
     end
end
for i=1:Nb+1;
       
         vb=(x.^(i-1)).*y;
          sb(i)=sum(vb);
      
end
% on transforme le vecteur ligne y en vecteur colone
sb=sb'; 
% inv(A) donc la solution est 
alphab= inv(Ab)*sb;
% on calcule les valeurs du model dans ym
yb=alphab(1);
for i=2:Nb+1;
    yb=yb+alphab(i)*x.^(i-1);
end
yb=yb/max(yb);
figure(3)
plot(x,y,'*b');
hold on
% superposer le model polynomial
plot(x,yb,'g');