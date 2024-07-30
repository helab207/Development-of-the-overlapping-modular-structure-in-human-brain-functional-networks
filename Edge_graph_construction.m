function [edge_corr] = Edge_graph_construction(FC_wei, weighted_degree, binary_degree)
% =========================================================================
% This function is used to construct a corresponding weighted edge graph
% that denoted the similarity between edges.
% Syntax: [edge_corr] = Edge_graph_construction(sub_matrix, weighted_degree, binary_degree)
% Input:
%       FC_wei: The adjencent matrix of traditional node network G.
%       weighted_degree: The nodal degree of G network. 
%       binary_degree: The nodal degree of the binarized G network. 
% Output:
%       edge_corr: The edge matrix.
%
% Note: weighted_degree and binary_degree can be estimated using the GRETNA
% package (http://www.nitrc.org/projects/gretna). 
% Ref:Wang J, Wang X, Xia M, Liao X, Evans A, He Y. GRETNA: a graph theoretical
% network analysis toolbox for imaging connectomics. Front Hum Neurosci. 2015;9:386.
%
% Written by Tianyuan Lei, BNU, Beijing, 2023/4/7, tianyuanlei@yeah.net
% =========================================================================
sub_matrix = FC_wei;
sub_matrix(logical(eye(size(sub_matrix)))) = 1;
[~,N] = size(sub_matrix);
M = N*(N - 1)/2;
[u,v] = find(triu(ones(N),1));
for i = 1:M
    A(i,1) = sub_matrix(u(i),v(i));
end
u = u(A~=0,:);
v = v(A~=0,:);
[M1,~] = size(u);

for i= 1:N
    for j = 1:N
        vector(i,j) = FC_wei(i,j);
        if i == j
            vector(i,j) = weighted_degree(i,1)/binary_degree(i,1);
        end
    end
end

edge_corr = zeros(M1,M1);
for i = 1:M1
    for j = 1:M1
        if length(unique([u(i) v(i) u(j) v(j)])) == 1 || length(unique([u(i) v(i) u(j) v(j)])) == 4
            edge_corr(i,j) = 0;
        end
        if length(unique([u(i) v(i) u(j) v(j)])) == 2 && i == j
            edge_corr(i,j) = 1;
        end
        if length(unique([u(i) v(i) u(j) v(j)])) == 3
            if u(i) == u(j)
                aa = sum(vector(v(i),:).* vector(v(j),:));
                ai = sum(vector(v(i),:).^2);
                aj = sum(vector(v(j),:).^2);
                edge_corr(i,j) = aa/(ai+aj-aa);
            end
            if v(i) == v(j)
                aa = sum(vector(u(i),:).* vector(u(j),:));
                ai = sum(vector(u(i),:).^2);
                aj = sum(vector(u(j),:).^2);
                edge_corr(i,j) = aa/(ai+aj-aa);
            end
            if u(i) == v(j)
                aa = sum(vector(u(j),:).* vector(v(i),:));
                ai = sum(vector(u(j),:).^2);
                aj = sum(vector(v(i),:).^2);
                edge_corr(i,j) = aa/(ai+aj-aa);
            end
            if u(j) == v(i)
                aa = sum(vector(u(i),:).* vector(v(j),:));
                ai = sum(vector(u(i),:).^2);
                aj = sum(vector(v(j),:).^2);
                edge_corr(i,j) = aa/(ai+aj-aa);
            end
        end
    end
end

end